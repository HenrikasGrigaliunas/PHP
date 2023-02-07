<?php
    if(!isset($_SESSION['user'])) {
        header('Location: index.php');
        exit;
    }

    if($_SESSION['user']->role === '1') {
        header('Location: ?page=admin');
        exit;
    }

    $action = isset($_GET['action']) ? $_GET['action'] : '';
    $data = json_decode(file_get_contents('database.json'));
    $id = $_SESSION['user']->id;

    if(!empty($_POST) AND $action === 'new-transfer') {
        $currentUser = [];
        $transferCost = 0.43;

        foreach($data as $user) {
            if($user->id === $id)
                $currentUser = $user;
        }

        if(($_POST['amount'] + $transferCost) > $currentUser->balance) {
            header('Location: ?page=account&message=Nepakankamas sąskaitos likutis&status=danger');
            exit;
        }

        foreach($data as $key => $user) {
            if($_POST['recipient'] === $user->id) {
                $data[$key]->balance += $_POST['amount'];
            }

            if($id === $user->id) {
                $data[$key]->balance -= $_POST['amount'] + 0.43;
            }
        }

        file_put_contents('database.json', json_encode($data));

        header('Location: ?page=account&message=Pavedimas sėkmingai atliktas&status=success');
        
        exit;
    }

    //Duomenų išfiltravimas aprašant savo ciklą
    // $recipients = [];

    // foreach($data as $user) {
    //     if($user->role != '1' AND $user->id != $id)
    //         $recipients[] = $user;
    // }

    //Duomenų filtravimas pasitelkiant funkcija

    $recipients = array_filter($data, function($user) {
        if($user->role != '1' AND $user->id != $_SESSION['user']->id)
            return $user;
    });
?>
<div class="d-flex align-items-center justify-content-between">
    <h1>Mano bankas</h1>
    <div>
        <a href="?page=account&action=new-transfer" class="btn btn-success">Naujas pavedimas</a>
        <a href="?page=logout" class="btn btn-dark">Atsijungti</a>
    </div>
</div>    
    <h3 class="text-center me-5">
            <?php 
                 echo $_SESSION['user']->name . " " . $_SESSION['user']->last_name?>
      </h3>
      <div class="text-center">
            <table class="table w-50 text-center table-bordered mx-auto my-4">
                  <thead>
                        <tr>
                              <th class="w-75">Sąskaitos numeris</th>
                              <th>Sąskaitos likutis</th>
                        </tr>
                  </thead>
                  <tbody>
                        <tr class="table-light">
                              <td class="text-start">
                                    <?= $_SESSION['user']->iban ?>
                              </td>
                              <td class="text-end">
                                    <?= $_SESSION['user']->balance ?>€
                              </td>
                        </tr>
                  </tbody>
            </table>
      </div>
      <h4 class="text-center mt-3">Pavedimų istorija</h4>
      <table class="table w-50 text-center table-bordered border-success mx-auto my-4">
            <thead>
                  <tr>
                        <th>Eil. Nr.</th>
                        <th>Data</th>
                        <th>Gavėjas/Siuntėjas</th>
                        <th>Suma</th>
                        <th>Adm.mokestis</th>
                        <th>Balansas</th>
                  </tr>
            </thead>
            <tbody>
                   <?php 
                  if (!empty($Client["transfers"])){
                        foreach($Client["transfers"] as $key => $value){
                  ?>
                  <tr class="<?php
                        if ($value[0]["sender"]==$Client["name"]){
                              echo "table-danger";
                        }else{
                              echo "table-success";
                        }
                        ?>
                  ">
                        <td>
                              <?=$key+1?>
                        </td>
                        <td>
                              <?=$value[0]["date"]?>
                        </td>
                        <td>
                              <?php 
                              if ($value[0]["sender"]==$Client["name"]){
                                    echo $value[0]["reciever"];
                              }else{
                                    echo $value[0]["sender"];
                              }?>
                        </td>
                        <td>
                              <?=$value[0]["sum"]?>
                        </td>
                        <td>
                              <?php 
                               if ($value[0]["sender"]==$Client["name"]){
                                    echo 0.43;
                                    } ?>
                        </td>
                        <td>
                              <?php
                              if ($value[0]["sender"]==$Client["name"]){
                                    echo $value[0]["senBal"];
                              }else{
                                    echo $value[0]["recBal"];
                              }
                                    }}?>
                        </td>
                  </tr>
            </tbody>
        </table>                           

<?php if(isset($_GET['message'])) : ?>
    <div class="alert alert-<?= $_GET['status'] ?>">
        <?= $_GET['message'] ?>
    </div>
<?php endif; ?>

<?php if($action === 'new-transfer') : ?>
    <form method="POST">
        <div class="mb-3">
            <label>Pavedimo gavėjas</label>
            <select name="recipient" class="form-control">
                <?php foreach($recipients as $account) : ?>
                    <option value="<?= $account->id ?>"><?= $account->name . ' ' . $account->last_name ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label>Pavedimo suma</label>
            <input type="number" step="0.01" name="amount" class="form-control" />
        </div>
        <button class="btn btn-primary">Siųsti</button>
    </form>
<?php endif; ?>
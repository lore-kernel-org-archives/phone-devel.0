Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719609;
	b=Rmscau8phb94yebp4rtHhkm958zpKk3Vvs+L1muY8bjjo0f87sfDlQaMYpl/E/XBABpG
	 SyzMU0LharIDlYrK5DRQeUYIZ33Eqe6Tt7O3iYskFiKsS7tZjCDPk7T/DEQ6EEOrcLB+T
	 oWwveSq9Inj6Axx7NMBBp52j0p1ftGQOx2AHdVwlB5azLvidFS8FmlLvgrlOOHJc7XbgK
	 +gkgPqzC7/W9YDcjiOg1h/oieMZe5RsnifE0p9YDkcfRv9D8a8JpsM5MKWrR5LYSpMaN5
	 8fmPvT8fgnjy286a/Y+06hrRf8GNtHQPozpfhiLOXJD/UyAPYQZhKpQ1TOl3UGFVNEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719609;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=K7ymiYInnsuA5Q53EewPdrFYhNjoCzCpkr9WJ9qOr0A=;
	b=QLcWTCCdwndrbe6GxLb4iEMzA1Ywq2bE2hHxbw5eNCKllNHZx7+QDvUKs1mFpq+c2wUM
	 XK8ITeSvzItwZeSKpJAUsCbqUC3mEmNUWJr7K8ck+Yf/2ienoVPys8hHTB0ZCuU3yK+Pj
	 fyickjI0gL1wAWZfowO7NsVWac0Y97P/ZCD0/lmOsz8WIKau5wdGl31ftPCFxgyy/geUQ
	 GtJ3/9FmKp3KUataxs/V3TAryu+Wz60l/q6v2vepadSspxVonLzaudzH3HhA3SI8zGuAP
	 vhn00i7Yu48cZwRFGEgBhS+G7P49LGjs4pvsYstdRvbYUwrjoQx3Ho5c9hoYfS1p1ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b="Ilud/c35";
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCA606A688;
	Thu, 26 Nov 2026 19:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBCA606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Ilud/c35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1795719606; x=1795978806;
	bh=K7ymiYInnsuA5Q53EewPdrFYhNjoCzCpkr9WJ9qOr0A=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ilud/c35MsgyW/kepDF19UqaOv4HtanH55j53Y0PbtGwPjYXhJKePH9nQwvelN3sR
	 EE0S5yyL1JgRFhL90BNX6RexGgDs36OBCUjgZ5pp9THfk01kh2+kHA7KDS6kCmVTHp
	 MfFazIjOLmpbQA9OnVN+b4W2DlYQOyeeWtsL3zNdu8wLCYJEvMoz5r7eyt8HyejiXh
	 wlV7fwImTcpRhpImk+j5Emj9iTkvpcfIIBZHaRnpPK77yc6GNEzMTh/BirsBXOBJ+1
	 q+F17pPqIykbONJoXHkWVTzOX2gYKMrnHdqfYD8S4VMARGjF4dQCd/ztOcwbJ7Qa9r
	 eUq5dEev/jpDQ==
X-Pm-Submission-Id: 4jb5TK1Qlbz2ScXZ
From: Michael McAllister <me@michaelmcallister.org>
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: brgl@kernel.org, enderaoelyther@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, markus.probst@posteo.de, mka@chromium.org,
 phone-devel@vger.kernel.org, quic_bgodavar@quicinc.com,
 shuai.zhang@oss.qualcomm.com, zhaojinming@uniontech.com,
 me@michaelmcallister.org
Date: Thu, 26 Nov 2026 18:59:41 +0000
Subject: [PATCH v4 3/4] Bluetooth: qca: Handle failed power-pulse writes
Message-ID: <179571958168.81221.2447983225223068787.wcn3950-poweroff-v4-3@michaelmcallister.org>
In-Reply-To: <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
 <hvwqozj3r7n7igxw5qogu7xxya4fkhqanb334sroj37ufzdizu@qarvtlkkulmj> <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

A failed UART write leaves hardware flow control disabled. A zero-byte
write is also treated as success even though no pulse was queued.

Require the one-byte pulse to be accepted and restore flow control on
the error path, returning -EIO for a zero-byte write.

Fixes: f9558270b85c ("Bluetooth: hci_qca: use wait_until_sent() for power pulses")

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 53239b0ab..d341481cd 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1426,9 +1426,10 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
 	serdev_device_write_flush(hu->serdev);
 	hci_uart_set_flow_control(hu, true);
 	ret = serdev_device_write_buf(hu->serdev, &cmd, sizeof(cmd));
-	if (ret < 0) {
+	if (ret != sizeof(cmd)) {
 		bt_dev_err(hu->hdev, "failed to send power pulse %02x", cmd);
-		return ret;
+		hci_uart_set_flow_control(hu, false);
+		return ret < 0 ? ret : -EIO;
 	}
 
 	serdev_device_wait_until_sent(hu->serdev, timeout);
-- 
2.39.5


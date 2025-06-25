Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70C28751F
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842718; cv=none; b=LXFjr5TmmGdZmA+Wg0k1oh3PJkjB2rDZdH2sed57BACMPlqnYwnt8QoEQnQ9oYO2p5ir26V3IbDxsA733r362Ai8E7p2Xlz2mmVKVd5A63SecGps1YI5XQTPEKG0v27SISVOpEWRxEVBqlNt1hUJKBvPd4n8Xuf3KVloxU72Tqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842718; c=relaxed/simple;
	bh=oNDr9/X8UcHuDpI/T6MeItHYUpNzR8kTjczcLR5Y4Rs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MaSwiPXrIZF5hK/e2S9OykwevAkYXW4CIagptC6pitKQq0GEN3/XGtxJbfgDtLE5t+zv7trxPvstjEq6RYAeb2glr2suVz9vk3uYIn679V+oGaDSZnFCM6LDOmKCgvkJOD4Fv8W8ImTdsp4TQKD9dAOHcJQfBXiQteQNKgHmqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y5J/uRow; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y5J/uRow"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so242401466b.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842714; x=1751447514; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfFXc6iptJS8RJF+pdB6dJ+3zW4rpMtdvg+gecd3YNI=;
        b=Y5J/uRowiphik0u9r/mbWlhdUhdGD4dy0AvPbd3tRdYgqqQ0z6EBSv2bzFh2GJQQkJ
         PP6HHH7ZNspAeBD4Ok4bT8dpcPIwRnvCnQ9LRS4BEXMNDG41SqE902XRwT7X2r1qpMIL
         g3eEN6LM/Dr84svFYP0lyyCay98HTrMObuptxl8kAcKDv5EY/P2oxLmUiPNLylSX0zh6
         ABw1QoGlIfKjT9DypqfpVxXFZr97VcCGe5Fv7odv5KOAfdpkb+xtBW+uAL5O8uzlT6G6
         qLy5sT+myrEs7R724nwqf8RWIdQnmigLV8b76e4sVApPALOTgIxuKXYchYDwwFf4pAHg
         4DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842714; x=1751447514;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfFXc6iptJS8RJF+pdB6dJ+3zW4rpMtdvg+gecd3YNI=;
        b=AjEKotvNbNmCtuEquhq+KZtqqXlen1IzDNRPegvnVRw7xNdRxrufFXgNNUJvnzeQmW
         yK3NBqdJbJuWfu3GOaSjP7bB1radadRSJTImColoT/GNn81jhbkOQvCLEUbl1E2shNs+
         Q0KenLW+9z2+HpbRUGPckM3tR9gSqqccdln28lK26cvE6FRtURBRFRvdLKVcYnK2hIGr
         rttUyiOvkcPXLuqehpmF505u2fOfvXRZ0xXyRU3oQv8JDg9r7UpK6wVTCickAOrAIbA+
         O7XOmr2wiM+Nwm6n86fWPBsyi3qc0BzpP99U14Pzjkm9bSqQuOB8XnIKuZwoN1PnHzVn
         rvvw==
X-Forwarded-Encrypted: i=1; AJvYcCW86wuRjgx7W7Jb6lIuwu01kFF6JjTuS1B+byL+Gdlh3F8DBDc6pSmLWtb2NRBOkr4VF9fCIuXZVyLBnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9ihGubQoU3XpS3MVUELGTQ/MUUE0I+X2kM7w0K3y9fDuGwy9
	UcOK/D4wjDl3v+89Rg+LMrDjXxvJNYInPPmjwm2+DcYWJbfYu/gMQoph4Qrr+grFgcA=
X-Gm-Gg: ASbGncutgAeteuGZSXoXkV9zUyMDXtyN6kpfbZoAs/W/Sz4ojLLjrqlAuiPNjKxgnS0
	nQsWSD1a+vxhVMnY/Yl33PMHlyle0eFAYrQLwlVUVnU6nYwGot8YlSl333JpiKA/iq3affmrSSn
	M1HDHJGbJmIxT7Ffc4ZJ+d6K7bqDEAJQ/8XfvZ2IScLoVXLw/IhqhesNYy6bRztmVDp7CnTCfKR
	d9rjc82jXmS2O8UZnO+cNLVWfN0AvS3dBPxwzfBHJipbW+NJJgzz+wKUwGS821T1gYt7NUFaas3
	l1gckBF+Vj3SEVPdmHh5At1MNuGERQbEUrAfWxps3FUTXfUpxcMcKtH0a3dcutPjSsYiBd6Bi0g
	dEqsxpqZ5VK+wV5FWS/vZcC37dJDp9ECZ
X-Google-Smtp-Source: AGHT+IGLwXMNfnnZ9yNaJO1cgTQkdowy9Zm9EiHvT+fTVIAaeRQJzn72dS9FzJ5dzo+2EnQB1et98g==
X-Received: by 2002:a17:907:96aa:b0:acb:5c83:25b with SMTP id a640c23a62f3a-ae0bebe8f00mr227086566b.7.1750842713726;
        Wed, 25 Jun 2025 02:11:53 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b39e0sm1007242866b.110.2025.06.25.02.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add SM7635 and related PMICs to socinfo
Date: Wed, 25 Jun 2025 11:11:43 +0200
Message-Id: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+9W2gC/x3MQQqAIBBA0avErBPM0KyrRIvQsWaRhgMRiHdPW
 r7F/wUYMyHD0hXI+BBTig1D34E793igIN8MSiotjZKCr8mMWnByFEMS1hlE661ys4cW3RkDvf9
 w3Wr9ALnTl6dgAAAA
X-Change-ID: 20250620-sm7635-socinfo-8c6ee8d82c9d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842713; l=701;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oNDr9/X8UcHuDpI/T6MeItHYUpNzR8kTjczcLR5Y4Rs=;
 b=hcguLzFSeCguAsvM5GY1KzH8aSsPu/KuTzADUtsgqbtgrxMkf9hJsPREpw9P8rR6xc0XWM6g0
 OZs5NPRxzneDMARH545x0WaJGpWyy6rZ9bYtj+rcoPK5yFDbwXp21aI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the SoC IDs of the 'volcano' family, namely SM7635, SM6650, SM6650P,
QCM6690 and QCS6690 plus the missing PM7550 & PMIV0108 to socinfo.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs

 drivers/soc/qcom/socinfo.c         | 7 +++++++
 include/dt-bindings/arm/qcom,ids.h | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-socinfo-8c6ee8d82c9d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


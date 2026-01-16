Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80FF288C25
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575053; cv=none; b=r71VgTgK8WU/BPP+/iWrgjLzc/HurtOuqh0ow8lW/LXaYWweZuc+foTPMEmn6pXPyct+KHmgos+5G6rsoy+fEkFtDANELXsrLsVYjDcvupsNDwEK2kdFilMcVDbWLTJbxI/XsWd1GOQnfrxwRp8TphQvpIOlG7q1G8MO1KVGao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575053; c=relaxed/simple;
	bh=j19KBQWDe/Rz5gK6EWY1R/yqcx2IUC6jLDUJGShA1/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aKIJPApzkuVQUQpsI+Q1vqs2EFaB2ltoapx+ARPgackCfV5J9IWWlDth0JXQuOFoycxS7DUgNXAPyFPq1a5Dl9GWshpEwmjU/xG9pgjxGCqAVn+w6uJAzar4yID8bBssZ/s8IbYQ/ZpbvwYsOK+Jg4jfm2OX6ooen8oo+1HFWeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w2JZmbVG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w2JZmbVG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so3374795a12.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 06:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575050; x=1769179850; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feX7GdONyC17SNSxDLiUHEZ1aiMyDYeRnXfn0/KIoIs=;
        b=w2JZmbVG6ZbCo8A3VLlu6J+8qAOS/tLBsOTRsutkZ9hykPSRWDOHvcTGw6JV0CyglS
         1ugZsc1jjV3F3dnavDoBX7f2l40GsTfLslTvWLokNjNADgmkloEzeYJI7hcqjAu/fOGp
         yiRPi/mZ43byAPefUAWO5fC4MQ06SiWPY7KpEzakco0izeQkutTaWFzEzlwO5pXufg+m
         s8pLvM1pUPg9qaAR7vF7LqUTrCyPcPy7vuMBSlyghVQxitTjSJ5B3FyeKg26D9m+7q46
         VEPc7Mej3HjjCC9TGMwVbiJ0ztU60h8xHrJyQjPoDZTRi4i3X6e7f7sz3UwxFrgkoByQ
         sJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575050; x=1769179850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feX7GdONyC17SNSxDLiUHEZ1aiMyDYeRnXfn0/KIoIs=;
        b=j/r32qlwPxNPXGvFYbXBLwlT6uled1VYSsjIJW2fuZncHZLHweyFWFx2kC1CKbVdXq
         dkOiz37WK8chogv35mKYzZ0caamvHq6RYOeuxXiofBUWcGU+DCLsd6TQfCJppWxA4VGW
         Icpbf7pIWYI9689NajC9Cyl131ciHs807NRmkL6gVqcBWej3PM79YTK9hvzmz4gcPR4W
         5IU5aSArjWEZI11XoDSeIsE7Z67+XsbRwgo7ov2igPC/iwE6/ghpI8Hyf0c9eTbQKObR
         7CJMMKi0Lo3R3DZrQ+nE/qZ0wRaI81Pa3c6MK3UH6CFgENApBA8GauKuVUN5mfPxZCjH
         HQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKKWbnfBhJR5fZnAUr49xIPNQWVna8ApIMAaHKjHJgwO477fewOdj2K3IvSG8seftHfJAcsQLjGO+rsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Mqt91NpoEcX5gwRL6tbwGBha6k8ST5tAJciNDsC8KNjy8hun
	err1BB+OearpOj5P92QY/gSmMLjInVBEY65pDxU76NbNyMn0JNwRorR4BmNFoiVg37s=
X-Gm-Gg: AY/fxX7yrlOWK8j7Br33mERTtkS890Y0+bddcf3FytwNCg0+5l8nU0nPyrQZbJaNi5z
	cB8covLtEA4akicddYfIryYOQCJk3ZK6zYmIUgGYANamcQ8Rc+GE6eZq+L9dT31+I/Jo8E9eEC5
	PizRA0ULIy+JI+W6L40DbTfq1U8rQVL6mwd4wpqBmq0iXNIdGtSXioyf83WwkUDNPXNJesBNNsH
	g5iwttuBjivcgCZUO06YIbrR5l0AnfhCCqvmZ+WwsFVBi6wAThyDoB1FWM0f2QiaATVNbL2BrEr
	4EqyFINbs4vwGxDU2Gr4qwayit8MG2obqAPQWQxhF92d3FyO6wlmhXDJN/s67Fd7Uzx999+7mt5
	uemPVgDAgmlD68ruUBJTx5CxYRNRJ3iL5ILYDRQT5dXpIP/0n7yNLvHFneVwJo1n6IUfhgA4vo4
	T4f9JfnblDg5jSaWPDwvtHWSXU5D1PkVDgDTr1vd5xRrsOsR4EYFhiNHBdOA+Y62Fn8d6Km64YU
	s0=
X-Received: by 2002:a17:907:a01:b0:b86:ff83:9e98 with SMTP id a640c23a62f3a-b8796945c59mr235945466b.28.1768575049974;
        Fri, 16 Jan 2026 06:50:49 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:49 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Fri, 16 Jan 2026 15:50:46 +0100
Message-Id: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QoCIRCF4VeRuW5AhdzYV4m9UBtrIHVTq4Vl3
 z3Jy//A+XaoVJgqzGKHQh+unFMPdRLgHzbdCfnWG7TURiplMPIzVwyrQdfwy4FR62Dt5NSZLh7
 6by0UePub12V0ode7022M4Gwl9DlGbrNItDUcvJxgOY4fJlT6rZQAAAA=
X-Change-ID: 20260116-milos-fp6-bt-wifi-22faa7b15e8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=902;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=j19KBQWDe/Rz5gK6EWY1R/yqcx2IUC6jLDUJGShA1/I=;
 b=AaVq59tmNLE1rKJlRmbsER++FqM7Y6AAPQgnHYFl1DVIC3/IMl2TgqHdcIDHspoyDIDl3oNwY
 ATgvA2UOkwnBzhuODE17gjMxFY+W7ZD6UxV3MaEc4mglUN0mRTiNtuA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the required bits to enable Bluetooth and WiFi on the Milos
SoC-based Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      soc: qcom: pd-mapper: Add Milos compatible
      arm64: dts: qcom: milos: Split up uart11 pinctrl
      arm64: dts: qcom: milos: Add WCN6750 WiFi node
      arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
      arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 191 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi              |  72 +++++++--
 drivers/soc/qcom/qcom_pd_mapper.c                |   1 +
 3 files changed, 253 insertions(+), 11 deletions(-)
---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260116-milos-fp6-bt-wifi-22faa7b15e8c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


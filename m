Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1A2206AF
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579038; cv=none; b=gpYDT4z7jNRDqjAaJ5vAZIRXMcBV6t8cadqgVxX39h66FiVi3nLY0WHHfrKLs2b4H4kbckYBy+tbPzKeVtuYeiPuvHxMHDlcUfHmMQMgC+xMeIgokjsIpjTLUVBftgPip0X5JKwV/3fMZHhJeGG42yHmxH2EZJUAX7Loap0pwE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579038; c=relaxed/simple;
	bh=hUdgjR/RHMYEJ230+g45ik66o3c8rPTSefQWcBqffE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S87HSZ0j/Hg2iZdjDW1J+blTeFS0orEu1UXyyttW7iE0iFlHiQqTgDnoSeKUrYc5vtaCF+CVLZMBkNQkxVREjvCBjJX1mYV+FVxwj2AnSBaWqlZsL+wroc/jcof12Oa0ZhB891O86yhWAYwpsZw1FFsRnT7oRtB/58/5b/iGUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DeOZhNdX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DeOZhNdX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so59968695e9.2
        for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579034; x=1741183834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6v2COQag385USHXDZetedSCoQTFZUjvQNehs7tzBwHk=;
        b=DeOZhNdXYJ0BLCNchdC3zPuh5engZ5KAccRSZuU5HlEK/qFmVJOdM1mk+KZJrlQHye
         GLMR/ar2Tp/V6LipuO/A5DhRC5r0O3S8fZcwh2Rc/aog7/7VZbrlPOI4uLRvsPjK0p2C
         jSFwizIu0ydRsfsBRdouuuycQLHvAOvsI41TEefFhp/7rUleRhzCSb/GP9JxJ00r+7uT
         nEA0ssVvwLz+Mgt+XY10elpypie2YDmu4iM0QW1IUhuhWZH0e5xjlZnanl82k/y4D6I/
         jEPbBe0RuUcb7jwPxD1xqo3GupikXR3p47ZlH9DEKb3K5kIS+M7oDtB0rwM+cFmHZdJj
         x0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579034; x=1741183834;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6v2COQag385USHXDZetedSCoQTFZUjvQNehs7tzBwHk=;
        b=PdNacLx6p19ZRZ4G/QRxN0yIpsYIIcEgex3DCLJTUEFMwJTexJfGFxkuEf56jaQwn3
         ByuZLAvkeBov4wErvF3HqKtR+ySHROXMyrXDeDv27KNryd9cSzzX8fynxKHYEgIJjeZs
         qI1hM+2VpAJ6QoT1aJJQdbF4ysJ0D63uekZv3x0K7ErOVTIZO2EGq46VLax5hyO2DOss
         ORdX58QxmFXKKpz9c54Xc8gamyd8uwEChSrHcqWn+ByjiuKpDXxbkJED/Cv3Mc2iLpsz
         yIURsrvXAW0zm3RrYXD506V9FrOjLO2Zd0IqNTZKCyUqhXMc+YYgCFB/GirvjbTtP6vs
         ljWw==
X-Forwarded-Encrypted: i=1; AJvYcCVOR1EM96d1wQaqfyhdO8pJ3YcuF7o64/+VLCj898a9XMjXMPotloWvWMlB26c7kR4xhb9KmsHgyUKryA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFMxqo07cPLK6ad51Rfky75lRzczEcFMKpfzXsDlQasSyc+mP
	XNk0pSpal91/+r4zqQNle2QMn+vTVGdGaKugFDnFbDrBPPaklm7OVmd3zgQw0dFeqE/r+g4yql1
	t
X-Gm-Gg: ASbGncuqJPcQ0JdxzERGXrGdGIJU9YwaySJe1cERZUI5hN2giHxv4PVEA//5b6Sz964
	F9XXdpWf7126XWNN8+7lOko0m6d488TyFvbN1MZVVmKCx8xBJSkL9Q0VDq4k/Nkv7jsH930EP3z
	D/3L7wEsRYJNomVLuD+6NGsiNXiLxKALcznjSCWoKxM6QT5GbKcbm8pNEtWy7yyPyrSLgbbVc2b
	yZQxM/pzCJk8GYzeQ3fuXXyrwQ8kHGZ3qOG+S+F3GYvvplkUkQg1ANigNFHBdcLR+24tYJhxhSJ
	/+EL7kRVXESjtmNnxgBZBr6qjuU8he+8lkEiUUuWJlT4Y2P/eCnv9L1S5BXOJteDOncgW4UEry8
	=
X-Google-Smtp-Source: AGHT+IE4o+OfE2YSudEnTjsH/f3XjsEpd8AL7T6UbGEbbpXVQOECvonikWzyjtQETBsUiLsBsFmVjA==
X-Received: by 2002:a05:6000:1ac8:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-390d4f8b64bmr2958570f8f.44.1740579034331;
        Wed, 26 Feb 2025 06:10:34 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd70be4csm5755889f8f.0.2025.02.26.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:10:33 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Fairphone 5 DisplayPort over USB-C support
Date: Wed, 26 Feb 2025 15:10:17 +0100
Message-Id: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkgv2cC/x3MTQqAIBBA4avIrBtQ+6WrRIu0qYbKRCGC8O5Jy
 2/x3guRAlOEXrwQ6ObIl8tQhQC7TW4l5DkbtNSl0rLDxdfoT7a4Hux2nD1q1Zi2kV1liCB3PtD
 Cz/8cxpQ+CQWT1WMAAAA=
X-Change-ID: 20231208-fp5-pmic-glink-dp-216b76084bee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

This series adds all the necessary bits to enable DisplayPort-out over
USB-C on Fairphone 5.

There's currently a dt validation error with this, not quite sure how to
resolve this:

  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#

See also this mail plus replies:
* https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 110 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +
 2 files changed, 108 insertions(+), 4 deletions(-)
---
base-commit: 417c2d4ed67b729abea7dc73d7fb2153b7154d31
change-id: 20231208-fp5-pmic-glink-dp-216b76084bee

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


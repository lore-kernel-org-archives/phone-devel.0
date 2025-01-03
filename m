Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F71EE7C1
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902724; cv=none; b=Lrs7BjkkHGREjJSGlgreU5ODQOmRP/LQt8xbPIEfWvOFGIPv0FJeVdrkmJ6dBMDmswPyNHcr+B1GxEFCFjKT20c7dGPOjLgaqK/hYkT4FwWO4Qjd9TnEzHFMTkGti/7h7pSWOaD7QoqvL3Ko77AN46Je7bqYRzWsyZRIeMvcyiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902724; c=relaxed/simple;
	bh=3Kao8cuA27nNtqtZ7ArvGjMkQrWXYdTWNUrhnNqarb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jT8fP1mQ7DPMleiI4YVMif86uqEL9iTZQMHLQMCYTFUeMuN6oLLv81HF6mfNuU8vbb0orp9N+QcSuArR9404DZq6PWvI1wWQ3d23ZbT9e3/epj+JW7j5L23OoKS1wNm2QQI80+RxRGuaSjJEPBj6JvDpC/gz+yKbcSkvVZaTxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3nNmUaqa; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3nNmUaqa"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so20910785a12.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902720; x=1736507520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlPl5jV33f2/R0ateITHqdG4xJP9TuWZHuBX474wyNM=;
        b=3nNmUaqa7oLBOY0uGgbd8yGnWsWqZt8L0lt4yT42jMg5VDKxsSRfpTIIHNdtaT0mMe
         g0BIRfnUXcaP4dUiQ7n+l4P8Y2hlnScKBm/FPxpFkzlMStwgxitezYFicQ6xas2XpQNn
         X22O6HMYDJldY6erH88eMyeKvwORqC0P7/U5hJylO/9IN7/ygXAbEb45yBr1/eFVANSb
         vb9dv63nlYOV4clepG+Y7vSeyEuxHVUTfqHpnJnAml1LXdYdf0UtaCyCNBQdyR0w6tYh
         bmImYNLXwGR5tsM14FrVMIA0OJAql+UI2CSEa1jOSq1PPR9AZFEqqk+aQOZ9ATJyOqBc
         nWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902720; x=1736507520;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlPl5jV33f2/R0ateITHqdG4xJP9TuWZHuBX474wyNM=;
        b=Bt0G5tWkArjgc5L0I5DChId9d7UJuLfx7furJljylkb+BiyZDML8M9+jy94hoSvlt3
         dk4EsngxPRxkQFDlwEeM+7lrSMgLqN6cUissjbINv16XJo2U4QZKzKhp6c8NNFeG/iHk
         iODOSj3vcM3UqtIJywQNQBcsS88x9niCCI+XICGG3MrV2/XRpRofBVhExkqHS+zTWgLN
         DgX/cWwcrXMLkOClw5+k3OfKe69mfPBVNrbvE69AgXe5gqaYOUmFZbClOYrqAm2kPo/L
         fIzFPdd/DhOZ9oeBn1EJHJ/+RhBISnpGTgHh7idn+Uf4kOKJDSPWz+E9pzWBj5RBsIM9
         VUYA==
X-Forwarded-Encrypted: i=1; AJvYcCUTyYGYFINybFf3R8RfH3CzzAgZakoHvogtdF6OvvJFtu5bd8ppPJSJyknTnNKlHqx7vb7NZ9KuCVktEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWEOg4rrK1U0Ii1Mz+X7rc+JzGCBiUcaMg3xepwqoUD6oxXZr
	vIIKZJuIpvHlSJXUwELW46UrXiQ39O8d6FurnpQMO0DrOXAmXsZKn0CkSwdUk4Q=
X-Gm-Gg: ASbGnctggsu15a/iU02Cs3FddQos/Li2rLWzDjqHp5H8xmpjG8NX/8Jywyi7xmvQahn
	G7AVPmmth2+OKrFGcTgFUsyWy/9ULEChLLZupuqDQD5bmU8iiboxDs1x/mqHCape9LA5CC1m6eG
	fNjHnlQ0QVSLCnPqZoGNCnCpYBITpbddqjWgsPgoXyjwyKMR8VsJRr+gmqNQryj4zPv1gYm53U1
	wSj2W3/GsvsA7E+yigcVI5xkgfeoYUmgJVq9xBS9n433vtHjIxLHbyqRY1N0x10IrHu+jOnpYsx
	km+RVMnczr2wTmlBdBNijek3Ng==
X-Google-Smtp-Source: AGHT+IHX9Gt1bpVbl5dPmi5oxB7HnAT6IzsM3NBq24bJtVCEfLNeIiPaDzcNkqDPYVwl8Jq7uV93+A==
X-Received: by 2002:a17:907:9804:b0:aaf:123a:f303 with SMTP id a640c23a62f3a-aaf123af418mr2914122566b.55.1735902720107;
        Fri, 03 Jan 2025 03:12:00 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:11:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Add EEPROMs found in the camera sensors on Fairphone 5
Date: Fri, 03 Jan 2025 12:11:56 +0100
Message-Id: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzFd2cC/x3MQQqAIBBA0avErBuwTMiuEi1Ex5qFJgoRiHdPW
 r7F/xUKZaYC21Ah08OF79gxjQPYy8STkF03zGJWYhISfVJoTUCilO+AWiuS1lm3LhJ6lDJ5fv/
 hfrT2Ab1uLK5gAAAA
X-Change-ID: 20250103-fp5-cam-eeprom-995e3cdcd843
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

While out-of-tree already two of the three camera sensors are working on
this smartphone, getting those upstream-ready will still take a while.

Until then already enable the EEPROMs found on those camera sensors
which doesn't have a dependency to the sensor drivers and gets those out
of the way.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128F
      dt-bindings: vendor-prefixes: Add Puya Semiconductor (Shanghai) Co., Ltd.
      dt-bindings: eeprom: at24: Add compatible for Puya P24C256C
      arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix regulator-fixed label
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera EEPROMs

 Documentation/devicetree/bindings/eeprom/at24.yaml |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 101 +++++++++++++++------
 3 files changed, 78 insertions(+), 30 deletions(-)
---
base-commit: 9ad93a473f97ce94bd3229e5dbbc4f1b2d48127b
change-id: 20250103-fp5-cam-eeprom-995e3cdcd843

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


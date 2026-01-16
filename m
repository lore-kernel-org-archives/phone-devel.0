Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59917277CA5
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570743; cv=none; b=exjjkurdasaowlMb4YbGqKFtrh09VchN3ctvC2PbnUAKbP++4/QGPXGFnY0T2cB5TYlMEPfHznEJnMzj78N7wew7+ouKr6zmVIJwd7Rsd/QeM+nMxO6XyGV+L6k8AoNJUSrCix+Qt4dDCErsQyfto5c71tNhvnyxcQvr7toMC1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570743; c=relaxed/simple;
	bh=vsB3iMV+9fUeGQu62KaTOVPfdptcCf+K+X8N9tzPOGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nd2apAzE4zDkxsx33pDlv4fKGHLFqoIfyBIMbToHHp9Zvhk+5euLbXhHaAchXkvaWeFwWPPLWRrsuKb70MJJttKlzgPW3pjZElUj+JQQKjcEklFMcYbrc8/vkNbKB/D7F2W5JJtarp/mxgCDlW2cL3S/V7JWevmqcE5BDdbYHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xnLQe1an; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xnLQe1an"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so3972015a12.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570740; x=1769175540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0U2+jzP6CDDUjkiod/PKOvsjawQoDL6waWdd/pZu0PQ=;
        b=xnLQe1ant3l9SZi28ySzLGJm6v/PKRtbGgESeIzZPELRgwS2TPpls46gT1G/00LG4n
         PUGrXwsm4kMt9AIN4XzHKFkpGHVhVWJaRCzj6Y7/l7vx6asUdTlALDycki+rP6J9xT4f
         qQp00xJVhO1lh5ZiPXXyegbC/tBQDla9RbqEKjEaYqbNGp/aoTi6d4asMTmaQbHHfCxJ
         CTD6emvFw4xiRQ/Bjum7e8r2FVudlmclgf6MNH/DBl7E9ddFtT+FPkx0O0FL7cS9MFFF
         MDwBW6k8UkTs3igeRLNzhYYnt5t4rnClQ9g/mhZDfi79awBl5ycf24B8Qqq09kaMHvs8
         5Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570740; x=1769175540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U2+jzP6CDDUjkiod/PKOvsjawQoDL6waWdd/pZu0PQ=;
        b=tM2rGPdnK5JYzxzy6ZPMM3aG6g+LzF10C7c8Rp5DqKd/l+zw9oOpbYMfo0nRcueruh
         U4fnJ32HZAfnjDZlnAjsQL+ADXHfvOL8RAP+xlpTWZ4qMAZz6ymCrR87vPrpdb8UK1xT
         7kq2P/Yhw0idpBXR8p7s8sgMgLzbUUvYVXl0jTDAw8kKoJloMx7zY6aUgdt4hbwKCTiK
         rCfPjd3KP1sINiAmPlGuDLIz+5nxrZ2VzvCSSiGGSxNY4+wDo7Fowtq+v8QpKSNCXxqn
         9N8XrAGcuDBSt5T4KX44QPwHVwFTM/Olczn7nrZXg12IMtpH77G0BtcK7SqAYs5L7WGi
         h2ig==
X-Forwarded-Encrypted: i=1; AJvYcCXFE2MD/HVDDq53oPxgOaO5Mp2cvSaGZ2Gfu4Vtb8K+qt/RzBU5iT7Z+6jolI6tWm26cPGlJsVkwOPVvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSiN+kxT8KmSwBnvH4OUGAvBbCPmRMaJzzsPgZ7dCMw6U6WmO
	XMbjn0CGW3p0Il1BoxHEL9nwJ65pmHIpaO2pSQWjmaC8BJpRaMuu1TeKIVvGiABRZuQ=
X-Gm-Gg: AY/fxX7UGK7PTsFnpPD8/nKq3BUQAaW8i3ybBkWYJbLQeOUOaCFG8A2yif5oV1f7aol
	hkZ6yS/KuuEO1fCaXVVAZ/7x/J4BIePBIlleWLCfVnNa1rtoZgNOgfOgmyQCKTF3oxktD3GSXTy
	AjsL+ZNiLfh7HLqMShu2oBQEyQNk8izSysmr4BGTqoZs+OKFPjuV8Jd50Xl4iMqhFr2upIRwHPq
	LLriDds13CwPPsVnr0MmN5Dj77FmZF0cyRxh/+L4DY8kKVbLm5AHSeVvVEAewFkQeks73pvfh9/
	BFt3XmsbJpEG5Z/eYAqU7jkF04Svw0KRcprLax80UbOt8UbWvPY0BMTfT4PoC1AMPqqVUhJ5AIM
	ndnYO+DQjlZJwirN8Xlyl+lX/RbSp5HGJG2Dw9LcFa6I0T3/cgPQXwU55Ap9V1mLUxQMfFGruLG
	9vqYiMFcVWd1DQweDFtoGsOsDUt0DBNVQxACpVS+3SDGyTQFtpWuBbUNMQiO7PCmMR
X-Received: by 2002:a05:6402:2804:b0:64b:6a7b:5996 with SMTP id 4fb4d7f45d1cf-65452cd951bmr2448309a12.30.1768570739730;
        Fri, 16 Jan 2026 05:38:59 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:38:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add CCI support for Milos, enable on Fairphone (Gen.
 6)
Date: Fri, 16 Jan 2026 14:38:54 +0100
Message-Id: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NQQqDMBBFrxJm3QHHioZcpbjQZNIONNomKoJ49
 wYtLmbxPn/e3yBxFE5g1AaRF0kyDhnopsC+uuHJKC4zlEVZF1TUGOQ9JrRW0De+clqXxLqB3P9
 E9rIerkd7cuTvnJXTGULfJUY7hiCTUQOvE/61x/+1Z9QZ07XWBWtR8rmKeuf9ndhrsxC0+/4DF
 rAbmMMAAAA=
X-Change-ID: 20260106-milos-cci-f7f4d8821e87
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=2024;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vsB3iMV+9fUeGQu62KaTOVPfdptcCf+K+X8N9tzPOGw=;
 b=jnLHxzy0FYbwtafB7PRM9AC9uGpEoNZJfuMcbB439ob1GKP+fonMo6eQtInrwGDpvG6BcUC0e
 egB1s7v5wyiDWZgq4PEh/deFSSlKnwSb59RUZlrLlHfMofOvhxT7A93
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible strings for the CCI busses on Milos, and the EEPROMs
found on the Fairphone (Gen. 6) camera modules, and add them to the
milos dtsi and device dts.

This series soft-depends on https://lore.kernel.org/linux-arm-msm/20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com/T/

The patches can be applied without the dependency, but the final dts
patches should probably only land once the other series has been fully
applied, otherwise the CCI busses cannot actually be used (unless some
other component turns on the mmss_noc) and you get a kernel warning like
the following:

[  291.055839] ------------[ cut here ]------------
[  291.055860] cam_cc_camss_top_gdsc status stuck at 'off'
[  291.055878] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x138/0x144, CPU#4: hexdump/1995

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: eeprom: at24: Add compatible for Puya P24C128F
      dt-bindings: i2c: qcom-cci: Document Milos compatible
      arm64: dts: qcom: milos: Add CCI busses
      arm64: dts: qcom: milos-fairphone-fp6: Add camera EEPROMs on CCI busses

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  18 ++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  50 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 194 +++++++++++++++++++++
 4 files changed, 263 insertions(+)
---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260106-milos-cci-f7f4d8821e87
prerequisite-change-id: 20260116-milos-camcc-icc-d41bdff31ef8:v1
prerequisite-patch-id: fc79344d381fea48318bbf62ce7c16b5687df074
prerequisite-patch-id: 323271b304b98b6ac0e98032f355de26c8e4fa6b
prerequisite-patch-id: ba8a70f210c54a14c69a60c26eea22d384b0397f
prerequisite-patch-id: de6e7d9f90ce4d8b37342e5198f042edee4b81a4
prerequisite-patch-id: aa3dc6c12366d6574b7e85808fcb107deddb8435

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


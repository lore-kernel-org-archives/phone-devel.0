Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E227F19F
	for <phone-devel@vger.kernel.org>; Mon,  8 Dec 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205969; cv=none; b=s1kRR1Pft+9bZMAqkh9/kpKMduPTmINXjCOn+OuJLxHXRkCVyQmIg60351ulwZ0jc8KGPps/kMXQuPfebDQPwfpBpW+LVbjKZ1m6x/ldxqTSQdBhg/4Zbt2UXAm+irjBDjPZ4tbKtK2r+AFQCsqy5Z9LnLAQKx/XyhZGQ48OEbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205969; c=relaxed/simple;
	bh=uLmS3zFAWWg3rczbGlkXkOenTYGyS9ffx9/wMN82yG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CdIccQUgPM1CuOZ5Eqv2JeZTgQNmRUYCrYkWbr4InIO0CkWOX4JzMzzn8/RpzpmgKf3zZInm9j/HQc1bCPEam2oVcuQAhgMrEmALvXv5AX90XN+4AQizuhJBd3tGtua16SEtNNO4xCmGatNi8RMSxdxlPHaIVNawTvtLukT7hXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SApP0M4F; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SApP0M4F"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so7984897a12.1
        for <phone-devel@vger.kernel.org>; Mon, 08 Dec 2025 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205965; x=1765810765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+to6IujjR5asOSoIClqkwi7ZpRp9+FoGFEMQuOxiZM=;
        b=SApP0M4Fpk10OVuWcZRcpAOxCQttP+51l5UUJr2rxfeLJyEoyYxtb8AwD4TRqPzs0Z
         fapRi5gg8MxEc7HUxgI8iiJF2FR8pvysOnfH1HaN4wja9LvX1Ee0goIsXXOjeG+JjWIw
         1ttuyF4X9wjan4gQNRh2a491r5/gQ/UGhbRquYp26VRNwY7VZiRF8e9kDCYfiRnSW8BO
         RkQQ3xQW8sTZmBQWdvrt4IsZ+92t3jommuuFZoh78io4+bNUTVRGg9iUSwvoxrKzRzNY
         bRijg3LdmN/CoLUlG4uEvXEg8WebBhWAT/WjWLBe0FCkbbqR+DsiWxERRRcuBPmB9VVI
         8LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205965; x=1765810765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+to6IujjR5asOSoIClqkwi7ZpRp9+FoGFEMQuOxiZM=;
        b=lKn7iKMjii9ujPZ+AeBkYlvSIMVC/9rdFmSgEU8CUKGsUILl1eBWq0sv4PNtuEsyon
         cxLDIxe8L14eK6u60V9zoTnci0+QM7vCuwGjUsHhWgMgqBLAjd1t4IBdEaN7oEYUh/Ho
         Z0fCUnSFyBKuXDA4He2ErQmOhNk5PUMo35+g4qIiBi3SgsMtwxJmHCp7FH0Xt8dTN2B1
         5hHQLuAXV+RUijGDTV9bp5J1mylgnGF/78Ez7LE/nb5nFzoaF4kiCwmp6PxeNIfIC1yk
         4VXxPTp42KsC4vvILeVjcf2Kp9GD47TCJcXlEWBxT6fSSR1t5HDMNSP0hyqYpvgDzhoY
         sqhA==
X-Forwarded-Encrypted: i=1; AJvYcCVNIpMBW8SZyIyiHwDjgkPmZdi1jQtp35+6POPo4CYuhU6F3QvOhx3E1ELalSrOx1ROYmGUsOIpvr/80Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy389LI2M3XaSr/BkoFUKZ/CwTdtB+p6KkSzSZbJT74esqz9vV+
	TCOXG0cO2lcAIrKkVUH7P4QeS+y1xZOgBEoNeiFsRXzlvMGWqnKk6UX+
X-Gm-Gg: ASbGncufRPVm0Zz0kzbOO4qWDJ3LDFRoPvkESahvJMyrWEoM8p2dgOTgoSnR4GcIrLP
	BAuh1OSYA7b1e1aVPfU8gm1GD86x7PD0QtHU5z9BP8u6edKdxlWSoT9ZWYUF5iWpHhJw8Kvsomm
	uDwmdA4Nl7E2mwD6lm6+OIOqE0SxrN/y1fNpJ8Ems+TAI+GTF93wRtk8RYZDRx6GU9MQaHiickF
	76fzb4fG2+4/nY2CqezoY7TXaPq/ZQ237SWspzonsJCNeqGIBscpzVagKK23CE1bu/n0rbjDU3r
	IzDfho00nqJljMlpBabIO37VsieoX7mr50mB9pTDaAZ+xN/0rjUrbNpgpfh6SCETOqWJsutOUSS
	hoDN3ZXMgJqohgqBzCB/sxoorUi+bGg//dNTBZ8CgHUN6TuEV5l/Y0J8fRzsMI/nu4Q88bmlQY3
	kRoa6AOOlpQto32w==
X-Google-Smtp-Source: AGHT+IG8rQqpJ2MB89ONVLWQ+Cg3vkFpX8w8CxK5GGu4BMGraZvYfazZZrEiZpBRcHA5m5CivZzELQ==
X-Received: by 2002:a05:6402:1d4e:b0:640:9c99:bfac with SMTP id 4fb4d7f45d1cf-6491a3f3b54mr7570377a12.13.1765205965464;
        Mon, 08 Dec 2025 06:59:25 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec300esm11365556a12.1.2025.12.08.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:59:25 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v3 0/2] Asus ZenFone 2 Laser/Selfie includes a battery
 measured by voltage mode BMS and a simple GPIO hall effect sensor. The
 following commits include support for these components.
Date: Mon, 08 Dec 2025 16:59:19 +0200
Message-Id: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfnNmkC/12Pyw6CMBBFf4V0bU1nAKmu/A/jorQDNOGhBRsJ4
 d8t4AJd3knOuXcm1pOz1LNLNDFH3va2a0OIDxHTlWpL4taEzFBgCigkzxOeq2EgN/JK1TXXmcg
 UCSOVSVigHo4K+16Nt3vIle2Hzo1rgYflurkA0l+RBy44pPKEMjaQ6exaNsrWR901bBF53MEIf
 zAG2OCZhERZICR7eN5mOXq+wn/Dd9s8fwDTozhg/QAAAA==
X-Change-ID: 20251208-b4-battery-hall-c707ae0d8ad4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v3:
- Added multiple temperature points for ocv-capacity-celsius
- Added capacity tables for every temperature point
- Link to v2: https://lore.kernel.org/r/20251121-battery-hall-v2-0-d29e0828f214@gmail.com

Changes in v2:
- Reworded the battery commit to include a link to the downstream code
  on which it was based.
- Separated hall sensor pin configuration from gpio-keys.
- Link to v1: https://lore.kernel.org/r/20251115-battery-hall-v1-0-1586283d17c7@gmail.com

---
Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 79 +++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)
---
base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
change-id: 20251208-b4-battery-hall-c707ae0d8ad4

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


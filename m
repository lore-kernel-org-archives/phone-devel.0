Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376F2D9ED0
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843148; cv=none; b=g3e7TcNDuEpEygaxPmyaFd821Pgy6VjA2I+bwV/jnlrkuFrsFUVQ9pSpPNyw5bV/Cir+aZGEen2qk3hy/uCXr5ZuXGdiMUlKc5iznN9ncLhjdM6y9nABq7RErxIHGg0VYFz8PKLdP0Ia3ChMo4bAMgJbSCKQKJ2fgFPB4Ulu/UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843148; c=relaxed/simple;
	bh=pUbk1uqDn3rkUzvHyGVf5FiMIjDaRG8buGqEDrG6+iY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t9iW7HktVH9gdwaIwWzXTQeAdhyMj5dVsD8RlLqCxYAoFR1UEncG4zTrOgqXjo0+DmqzCfDEuoXnYu8Y6dVRqR+7k3Au8ZuXXhE10r/pjOVkO1zqyGlhLgD5nsrLKF5edpjxCXJzMhwP4iasWkFRlvIu+ycvbu+Aj9uHsAyqnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IPWW2O/G; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IPWW2O/G"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9545207a12.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843145; x=1751447945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTFzCvwRXcKyOlaP6VWm+NwlDdnptDG85UUcTbjMo4M=;
        b=IPWW2O/GHDydEyCavPkKeyHTHKHDEbs+3Nv05PlnBskTX4zlSVarCU2A7BO2o02WWr
         oOZMBYwVdJDII9ZWqRzxj5+7sk2WRTPgRRlFNDMVxqIl5HrJWmpRt59exA9rmmrBFXnO
         iXWlfBA6FMx70SAEGhK54vkT0IY/zGtI/E7iypMcJRlkULHPUAx+2i/Vn8kNgIq53QW8
         gsxO0Efa/AYR0Y9cyf0zNDoitBTyLswZ8bgCEcjw+2t4gM2yl/GJlIj3LAfudkG5G+7F
         lC5rdj/qypDpFGNrljitFMyyKNo84qpCEam5z4luPDdL/2lHd7i4eg2Yg+4+4VCBheo7
         Bd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843145; x=1751447945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTFzCvwRXcKyOlaP6VWm+NwlDdnptDG85UUcTbjMo4M=;
        b=ahjAT6fMFU/5l17xmnBuycI/TF+M+/X6/KswXIPzsXlt5/KzR04WwmJU/oxa4kGtmD
         fe/uXvwM5/KXSFAmXRFszAH14P+rY1fT7EAW/8OIYqzzgvubzqq5LXMQ2T4n2EtNgnrw
         +9JfRMuGG4iDWop+D0nvb+OvnieLNPjNoOxOQoDFLuSW2LTajqDGdVVrHgSmiCHcpPEj
         tF/nOecAHx28mUx4JhDOKiJhkowSAbgoQVLnsqf3GGsc1CRrAS6NILrhIxN5IUTA/IDp
         46BoRzp5iOtDZgFGi5G7Cx+PPCUv0ij4vmF9oEKQrwDtvHiccPK0Ecywb7yLjZ3VEs4p
         rIRg==
X-Forwarded-Encrypted: i=1; AJvYcCWzLZeyYSMMlG9QnmFGc1ei83tUTWu4TXCj1+zmXQQXiUD0VfZgEXeEGcYRRlXYLmAO7G0o8x1eLAndRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTAAIOXQSlTt5g9Ly0lshw8y0wFOzwHzH54nAGaLQsA7t1wL2p
	1NPcVZs7dkCjs2cHzk1w73v18cg4HSeYqf1kNBgqXJdK+fn7g/iFKMoynu9Ugsrb304=
X-Gm-Gg: ASbGnctySyRtwK/AYTakepfrHNXNmK2O50iGScgJSMG/WYvOzrPBRLz13uO7qLjGhZF
	POVoiLZrMGaPIB3bKjgb8T4ap9BuNXWVU6I66KxyDtbhoLzmr2HfOrD/M3HrUhLNtEZ+wnvHar5
	DMjpwaiuHAN1NeRkHAZ5/V8kcQXuAIpSOV9bnulktH9C022wSYISpQHFk4doAeOx9JfknV99QqS
	2CQ1NgyjD1Um2fU+EyGojFYWBjNzHl42HsglPI9cmLtw4iZ3JWvVAmFZUNtG2f9hwx1j4ssUlVM
	Nk5b3z1mA01nbYfjuhxV08NIAMnR9wJbr3GmoQs44+UEfJZTGUM1lOBxCciW61yAT+czfrsFsyr
	h4dxls2zOvJbtKMPxTkG+0HBrwq16DWkE
X-Google-Smtp-Source: AGHT+IH8149yP9D8VkRVzc5ItiuTtvTkM2SP+ZetN60G4hPLdR3fSCS4GsHThskLkKTdSjnQ5A6uxQ==
X-Received: by 2002:a05:6402:2548:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-60c4de4fe80mr1738458a12.30.1750843144927;
        Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add RPMh regulator support for PM7550 & PMR735B
Date: Wed, 25 Jun 2025 11:18:55 +0200
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP++W2gC/x2MQQqEMAwAvyI5G4gtsepXZA/qZjUHtaQgQvHvW
 zwNc5jJkMRUEgxVBpNLk55HkaauYNmmYxXUb3Fw5Jha5zHugZkKLHie0eK+ocmakFrqgvDsp76
 HkkeTn97vevw8zx+M1CBJagAAAA==
X-Change-ID: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pUbk1uqDn3rkUzvHyGVf5FiMIjDaRG8buGqEDrG6+iY=;
 b=9SrihxBYIY5Fo98SHHtSnS8hT8vJEMRffaa99XV2DXPTTOlML224CrfPKke4PaDDTj/ageEdP
 QhFBOtbw+BWDlxNRwakK2ZhdgZpY6D9Pk5a8taiiIRq8Nt8dXilDPmS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add support for the regulators on PM7550 and PMR735B, which
can be paired with the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add PM7550 compatible
      regulator: dt-bindings: qcom,rpmh: Add PMR735B compatible
      regulator: qcom-rpmh: add support for pmr735b regulators
      regulator: qcom-rpmh: add support for pm7550 regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 35 +++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 58 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


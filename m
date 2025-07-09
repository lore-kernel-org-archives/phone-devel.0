Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FB284B27
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052725; cv=none; b=GNtYQxvmDVGOARInJNj39PXQJZjGwL4nSSddeN7c6mA8SeG12qgb4a9mS+fXR1F5XxZG4RbWGhavVFjlFahu10fuiEpsYxaL3JUy2TDdsFtttTtMIWEEEOvUWZVQYSSyxdXLkBTLhU0er1G6C2m+0imfE3KTvZ+SfEsqKUqdCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052725; c=relaxed/simple;
	bh=MV3Dv7givJVTh/7aMdoHauUQLRrYUXGf0nE/cB3bHng=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TRwrEVE1Z90RzRJ2G+XEcimDadnrLXAd+/1SmFEx4ZNhmjrTypR+lrkrFO/u/7t4u3masF78t6cNVfjDA3ld00h+aLGJ8CBOC1B8xlJ/KmgDYc0UR7wW+1QASfG5gYaswYRMpf8+uw9yRdmA7oaCWEcZz/cZfwle7DaRLWF7JXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1itLLiXC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1itLLiXC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0dad3a179so923396166b.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052721; x=1752657521; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddjMZCutufz18eoluPVKeaKDVNqg//G7ZHMUNzfUaUQ=;
        b=1itLLiXC+HST0QL0upnH7R2RScphF6d1nbOoj5AoYrc1bW5LpUqRAwS4krDfotJh+U
         f10aVpUO7wiMyt9y4qEOnlAPHr8ydS9QzOzl3uZoQfTHYj4KGmkoeIPrioXqDU7YNXyl
         gdW83KiW0aYABmDTQGurH/vXvDdfScW6qjK6pqb0hNz7ieU1iCjq2rWBOFoJZcWng5zN
         WkO/pVo7xtOeXAo/0uurHU58nLbsY7xe+HxD5jAqAuXibKqNu+Pz+v55ebF6OC5qvSR4
         1fGUVqVU1j89hwYcfRsZ0WcA3AvHW7Z+QOSBH5pDvXKO2ROvCst3oxk55NQfjskeFClv
         GdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052721; x=1752657521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddjMZCutufz18eoluPVKeaKDVNqg//G7ZHMUNzfUaUQ=;
        b=XwPHxsDckVRCBb2CyWaeqntSmAU5/re/3F9ahTfFuYKzbCiqAEAo85nP4IVontfuf/
         IjcOC3p/mTWv/Pp1qH2zWvjzMGRwGbHv+8Ri86HgQEQGdy5y/vaoDcaEGc3ZEaegKRc5
         +YXfWPa+f8cobxhSMv7OGaSZni4AC79zEbfzBroOORIXLZCK96rmwEYrrFSB+IMGKfVr
         n99US195mtFoJDMaLHPUS3QSg7zBZ72xygDEPtbsRDt2YazeHXxCpXgAkL6HOG4scvPz
         3kP8KV+xyGW6JE/8JLX8PqSqvqbE5Gh3+fUapYNW+tFwHGAmWUmCp7jKTcbvYt/3DQck
         VCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLPK+geRP3NFjxRezBAVevd+2Rc9B2iYNU22aD+jrJ+W7gtQb0hiiQJsO+zwQ4SnJ2wfWKx+S9xMzAEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznoIvkkAtBdHuTtS/Ptu6c2pDJerJwkYIj9zBmtnQ3Q0srUrG3
	Gopzs+qnk8syZ+D5F9biA7DcsZBCuWfmWxs6fEQCW9coPaFZnBMbWX7AD/x8KY+nsRc=
X-Gm-Gg: ASbGncvat/kWN8xlmeOKv+wD4kcD5kk7OnKTmT3D0vvFlkLUGa9lusin2qH5urEoQHR
	/C2ke+4agtMzr0epzmwABcJmiYBZ23GVwHZr0CBRWTMPd8MbFLK/k7T6tViYJ2T/37deppPq4Hv
	fLPTjALs3ZDfz7eP90Uy4rEBe5UYaU3dvNXCWlrCjKZ+TVxC4laOcTjVeeI2svSU2i+iU9gTaJR
	Kqp0hTCn/bmtulnL4DDWFMX1vo0JNPOUMpT9XL07DMp2lMnySUzDU4cZWY59H94TvlSOqlNhQlS
	0BSIyA/wwHAks0js6xOnmuD2r8K6w0n8C9ezT/xSZAVgNLlsUWuQ+h96Wlo9lmLv1JoSfthmIle
	pw01nCmsNxx9fgtzkOw0A5GMx+Pak8cUi
X-Google-Smtp-Source: AGHT+IGK3bAftfEkjpmdqalxkrTWESjz3MCvrr9nzk+X9vGMEXTSCOonJxgJBiArXN52o0c+vXAJuw==
X-Received: by 2002:a17:907:7288:b0:ade:867f:1e9b with SMTP id a640c23a62f3a-ae6cf545dc8mr168060166b.9.1752052721104;
        Wed, 09 Jul 2025 02:18:41 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Changes for the eUSB2 PHY on Milos
Date: Wed, 09 Jul 2025 11:18:14 +0200
Message-Id: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYzbmgC/2WNQQ6CMBBFr0Jm7Zi2QFFW3sOwgHaws4A2rRIJ4
 e5WElcu30v++xskikwJ2mKDSAsn9nMGdSrAuH5+ELLNDEqoWmglME2NLmukVxowuBVtOfSDri7
 GjhLyKkQa+X0U711mx+np43ocLPJrf636r7VIFHitbKNJaN0YeRt7jsH5mc7GT9Dt+/4BitOXv
 bIAAAA=
X-Change-ID: 20250620-sm7635-eusb-phy-d3bab648cdf1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MV3Dv7givJVTh/7aMdoHauUQLRrYUXGf0nE/cB3bHng=;
 b=TC3jsdtAaGPDvRxWi6boglngHAlDnksgBGQq8S9tpXg1SjQUdqq4+co+KVLo05+XfgmXWX1Oz
 gTuLU8NPuGJCMRJ3mNYWVqGXOXOuOEAav4nFKT4PSVvhJtoRakiZPKE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on Milos and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Clarify commit message for "Add missing write from init sequence"
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com

---
Luca Weiss (4):
      dt-bindings: usb: qcom,snps-dwc3: Add Milos compatible
      dt-bindings: phy: qcom,snps-eusb2: document the Milos Synopsys eUSB2 PHY
      phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      phy: qcom: phy-qcom-snps-eusb2: Add extra register write for Milos

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 9 +++++++++
 3 files changed, 13 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06547CA61
	for <phone-devel@vger.kernel.org>; Thu, 10 Sep 2026 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043259; cv=none; b=IBHgJNR6gctteS8g7HUPPC6kysdIe2PodQQmIyHJLJ5jMc+lvfRno662FKs8qfQL4ZbzQU3C+Mz+NewfULReyY4JviEMll3PhBhbbKxGv5y/b7nBkP+jp2UlGrPpBry1/rizzlantliQOG+KoiAPI1dI7xZZvxnrADye7kGNGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043259; c=relaxed/simple;
	bh=VmGihf/otJtnRtKQi0yPp8aYp/mbw6d7VxXe1RG7WjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WpavjHQNtlfjVw1Q1XolLrrEt5uoVnApgKjORP6+nclY1mADb536effHDVBnnfIC08Rt3LzkXmqzPzUQG2eJg0DwIMsfA3zqDo9/7HGw2XXzuAtsiU9lL441A/tD1X2TQuxDarvRCLkXIuFELaPujR/UD/2I/+D7Iwy61UtIOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSIRHNj+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSIRHNj+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25b661d37dso1038119666b.0
        for <phone-devel@vger.kernel.org>; Thu, 10 Sep 2026 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043256; x=1789648056; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vmxR7CI2nXV3R+7df/uX9sx8R8vTa3P8FC2uXh93REI=;
        b=SSIRHNj+sdmZwP2ZVvWX0rwNNDeXtFgbL9uAhnXf/s9ZC2XVfW/RUnA2gD6D0p13XB
         kOkKUE2IueaS38UMv/9stFXDdnlHoqHDQYFOfQtgjsc/3tJz0qo/8TjFowFvhMynh4cY
         8gJvprZaAWN/MFhKeaUZrB3isyG8haYQcO9SnD0Ribdk1n2KOOWmtjjg8K4UPlgeSIqA
         ISXoQ2t6a8g/URKN57fJm/AuHR2VfmLZiUZ/AoIFEEfzDQcISYfVlZXMDTqOFS29pskk
         j3kkXtC4IFtRpweUzrJ5WT4AEMxPU/5bIvW2y8hiyls786/0UqA3foiOU53USmNp+CGY
         Azkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043256; x=1789648056;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vmxR7CI2nXV3R+7df/uX9sx8R8vTa3P8FC2uXh93REI=;
        b=dL+KfWPM7+OWgWB7K0aOOJxrl9g5ShNaMVtQ/uRpFaUiPGqS9XhWPGNvgvlk8Q+rVT
         iLF4IQxLXmgo46s+3arDGdp1uBVtBOlMdgt1Mtih3+Nn9Vol3TWBohNKKnJobuf4JK4G
         Hzi09O+87KHfuMBlezq5pf8PRpZp/T5jyjCSj0Y2Qqk3B3cLPTLxZjk1+spUyN++uMIZ
         QrPshQPrQw+kxya7B3zyxeUu51BlU236D7nQOq5loAIlRDRNXgr3DBXLD6DKIZY6R8mF
         57emFfM7S26wFGh42DXoYhwsLVUyBREH9aZYIBifCvaXh55JzcrJ1uPyRo+XH8uVmqMl
         dZLA==
X-Forwarded-Encrypted: i=1; AKwUvBwhniLJ2WEIqiCPDEC1omPsqNHZ7ituSoBHZZq9ugoBgRUQFQ/FGJJlpwnJvsBO7G3YecJZWkd1/zzZRg==@vger.kernel.org
X-Gm-Message-State: AFuF++k+U93gXSb1ohvG2CU75/QXtvyyvZJgP86hn6p6ACx2aBtwys4I
	6WRorPWHUWdv0+Lf9j4ockIXHfJUGJniL7SVZU5NwkyouWcZ8mVgJ4VdoiczLg==
X-Gm-Gg: AYBFou1hrU0EmlpHh5t/KlgN4+k0AV90+N6mcAgVqN+bCwXRejvKsuLM6b7s0RTXXY3
	EEU2UPHm7RfRWcvQMoDjSUCrHrT/09zPV5MDMNNTbsmqGIhEXzZ8XXqI83401Nc/hsOklhC1Jg0
	YpGC7DkbpL84ZLlO5b6ARYQuhEgnL/OMTxjYJ1gyGPn1h/ipOzGBdUwFiWKl7/oGT2Wwj8MiJ3A
	++w0K6OzZ/nU68EXgBQMXV8pRQOeEkdvAlPYmhGUa11UoOyAnIU3vCUwmwPu+fLgpXEiGCHgiJU
	bi7XNpeBg9mbrKvcTvuxLAgxVo6sVC88TNMrGaoh4+ZMyXKV71PihipuLU2Sx7pKIrMu5bseSvW
	RNfqmU/IDyD/wrQaydRieC8NnjO8CmVhakyGQzXZYWf6ta7ecrrQJhbV5bO6I8OB4rmPJpEZIDS
	9DQemOTzE/M4rmUobaghtGwZxmmpN7c8oXqsl3H5XZNKeqBfaOYoqq9uoz8A==
X-Received: by 2002:a17:906:ef0a:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c260c7b6576mr1724975566b.8.1789043256130;
        Thu, 10 Sep 2026 05:27:36 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2951217d12sm65136066b.44.2026.09.10.05.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:27:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung: add
 initial device tree for SM7125 Samsung platform
Date: Thu, 10 Sep 2026 15:27:20 +0300
Message-Id: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
(atoll) platform. This patch series introduces support for SM7125
Samsung devices with the following components enabled:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB
Along with that, SM7125 was affected by a hang when launching SHM
bridge. A similar issue was reported on a similar chipset:
https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v3:
- Updated copyright information.
- Added tags given in v2.
- Link to v2: https://patch.msgid.link/20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com

Changes in v2:
- Renamed regulator nodes to satisfy dtbs_check.
- Renamed pin configurations for SD card to satisfy dtbs_check.
- Moved rmtfs_mem to the common dtsi, shifted addresses 0x1000 to the
  left and added "qcom,use-guard-pages".
- Converted decimal 0 to hex 0x0 where applicable.
- Pinctrl names are now listed after pinctrl themselves.
- Renamed vol-up to button-vol-up to satisfy dtbs_check.
- Framebuffer uses cont_splash_mem instead of retyping reg.
- Removed pinctrl-names from vibrator.
- Added a blank line at the top to the comment for &pm6150_pon
- Added a comment explaining what the reserved gpio ranges are.
- Added a blank line before "status = "okay"" where applicable.
- Link to v1: https://patch.msgid.link/20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 6 files changed, 581 insertions(+)
---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--
Erikas Bitovtas <xerikasxx@gmail.com>
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


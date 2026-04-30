Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC5251795
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533052; cv=none; b=GiVexeGoiKZdLzJErfUJBwVoVyrQFgYzrqhzQohE8Jy9ql9aoehtPoj1tIKSkrygAoHFIL4wtFEtkbYCm1WUSvqKwMN3Xs42YFXdqrawosVcCco2Z+VyTxFA8/egeAwmwNL0a6gp7BC520obE02I3vA5LCA5sWCR0M20Cyv30ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533052; c=relaxed/simple;
	bh=QhQKB2mRUuTtgEbrNzVyQWry9Jhf3YZS5lk/FPu/bGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IpJBblbgGtIWeFTEvK0Z9Yr5rA518g2wJ4eRQuJGTwecCRWTUu5+vPkkvKGnfkLQzIl1Rv6EKj9Bx9BQQC/QQRpX033dOJxqCFHlEbr5oxhBUSMSI8lesnc2hubpg6S41apcRrsHQmecNhe2CWS3FUXQYpzM95+0ku5Gd5AFV2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fYFej4iR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fYFej4iR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so4701815e9.2
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533049; x=1778137849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aE4vBf5pFQqHJ7JzFp5lwW/U6bPFUoFVmhKlS9U+c7s=;
        b=fYFej4iRwj8Q47Zjp2yyzDeW1yrn9awRIqN4FPApvdIIzvxZsrSPYFNLMkv9plRVHK
         u36fchzOs3ivYM1i3fsk5d/OExiutj08lHhVfLSWA26UOiKGMANjvQEq6mRmCfuH/+PD
         2Zpv8/easd0St9SWAkQ6TcByk2Lx16vtaDAujpjpNcAWUa6wWqGE2xVeq0uOODjX0Oq5
         MDfKP/nwJHCPncaSMzAb1BejIsSa5RRHI9uM19Lt+BiK4eHRlxGNOqrko6emkJxu8lFg
         vDF2ELXSfSbo8IuFqb0I7ueY/327iLsgARwupuFylW/X3M7OREpIGlsPTvrC9YMnCmDt
         QxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533049; x=1778137849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aE4vBf5pFQqHJ7JzFp5lwW/U6bPFUoFVmhKlS9U+c7s=;
        b=KP5VYBW0nuDdKncxryU12kqlz+yb6NlqcvCl/Y0zXKGTC9cK2V9pg6C98aBZaebw3g
         gNC16eML1UxgI9yx0RwzPigLf6zLSL3nsmlYppKQPD6E9ftmnV3s6t7BiJ75vsPXEEzz
         5tXAcX4tti0eUDb2EytAcs7Ir1HZ1fPATTf4fBfjnY6fAnoIFNSyRKGFDbgM4nYj3vQe
         HBmrR7l6NxYWtWijWVdrbcNxGLA+MutSW5pcMB3qzipqSiczL8czkZaDEkCuRNHBzodH
         alr6DpyYPC1ZgbwZ/8uRLuJAAqXEvnhMUXGos5kJnP/0h7gBeeiMYOSYoKZRTVGAlg3h
         bJBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8C0gzRR1mKO5QdCtLHXlu+KtFk+FsDG+Ihvsutes6hlIviXElGdt0G0W3ib3WBU/pDWt0yqrNf/+xXpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3XkajGy2RUv2R09gkqK6prUC3ImJ9itMlL8TeWRblbmcJmmd7
	VM2lSypQGHtOx1V4bi+oxozlyCh7igsVt9ZX8aKZEGEn33r5t9g0pSTktrYwO07Wn0o=
X-Gm-Gg: AeBDiesBhLpm3V3zz+dXdHgC+BkMad2qwuL+fq8BrFzWCzsxerEcy/oiP9hyOjgB0Ms
	goDZHeZFSLAha+o1l/ymUZ6lnp7l97h36duu1fR+hHKYSbCMO4+RLZ2BWjOTzpZNemmbJzCJzkj
	z0XWeTfYdnSfhxDpbI17FRm9J1N9FWd9d9gohuLVJr12xAZM6Tba0nicaIqD3YXhRrPZTmmo+nd
	wmd9JfsnU/I8gnKmchSvxeDagPaRsmYv0LaqyGU3Q+kbhPqA905L+Ok974K1jnQygFRvZHvBbfz
	Zr6fNoa4JOcApEZJ76nI6HkTIhJGRHzMmpzN3UX/DhhKrNQV5WPsPPbJceoygLf2Cty1YX0Yia2
	7ay2KOpKrr0T8bA610qY25gTVBs8HzGS7kcFoTFEvTxbnpEbVaOIJ0JLhh/DH3XH+9mFPwvJ9+4
	CPDyGC3yENK9zvOH8RLsLU9BPhLVGf78tMnhs/zNFmXP4uzeQGlLyQCY69wOH6lmxWpReHvixSm
	VSckMEJRmu/KtFgGDA=
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr27890335e9.8.1777533049245;
        Thu, 30 Apr 2026 00:10:49 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Add LPASS LPI pin controller support for SM6350
Date: Thu, 30 Apr 2026 09:10:40 +0200
Message-Id: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6DIBBFr2JYdxpAJbar3qNxgTrWSQQsUGNjv
 HtR182s3kz+f7OygJ4wsHu2Mo8zBXI2gbxkrB20fSFQl5hJLhUXsoJgVF5yGCeCOBoDTdfqosO
 mVIVgKTV57Gk5Gp914oFCdP57CGaxb/93zQI45Kqs8l7qfR69Jj8NzuK1dYbV2ynw+P6kT+NpY
 Y0OCOluKN4zi0uEw1DIW0psP3Wo3APjAAAA
X-Change-ID: 20260128-sm6350-lpi-tlmm-bdca4deb5641
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=1992;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=QhQKB2mRUuTtgEbrNzVyQWry9Jhf3YZS5lk/FPu/bGE=;
 b=I2DiK9SeNbN+KP+wFWjjnhIUJ5RMd8BNN8v7oSbkqI6PJiH33CQS4/zUIe1YOvTRqGpykL5lV
 mnap3+ig0YYDu9R0Qnbs2gaD0qG+DRGisKOaB0mpJe9VF64CG+0olfz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Introduce support for the LPASS LPI pin controller for the Qualcomm
SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
in the arm64 defconfig.

The custom slew offset for gpio14 is described as
"qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
some reasonable solution to have this handled correctly in the patches
here, but suggestions are welcome how to improve the situation. There's
of course several ways to implement a solution for this.

[0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix dt bindings example
- Drop note about too little register space (Konrad)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com

---
Luca Weiss (5):
      dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
      pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1 for slew control
      pinctrl: qcom: Add SM6350 LPASS LPI TLMM
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  66 +++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |   9 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   2 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  20 +++
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c    | 149 +++++++++++++++++++++
 8 files changed, 372 insertions(+)
---
base-commit: 3d33d10c2d4f964c9223fd9a27eb7f0ac733c216
change-id: 20260128-sm6350-lpi-tlmm-bdca4deb5641

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


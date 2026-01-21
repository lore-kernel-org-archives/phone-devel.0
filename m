Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD133D6C1
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001990; cv=none; b=hwu1Y0/VFVTWh/3regddZAWUwSPuQxKfndWFvjuE0UP6/doHoYbs8aUK319tkfyJpeDo3WNT/G+KHRHoaGEKFT4CDh19e6B24TAiO1bDiiEjT3nF7J5IlBWN5SG/0Dn+Q0TknbuyrxfWvNqMl9kT1ZaQXCRlcWB+IUDPf8+TpgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001990; c=relaxed/simple;
	bh=Ilw6wqzweYkqw4rgm0eEkLzCzIBlYAKWRV8Bde+ERSs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X2sUSRGkeem76B9sBbuCT/TuGJI0ur85DO3GK7FPwC9J/evPEdkh7PnTBKqLovtEK5URs1vtIRxw/Dr8G9vgIVEGXWhBDOYAjAtqVeWLCiIAvoYzWzgWYEkJcopEXCF0gOMl9VUi5kG6GF5RDZUEuq5ztMdEEa18DzVJEQi0zkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9Kc8f2y; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9Kc8f2y"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7afb2cf09so3816485ad.3
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 05:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769001988; x=1769606788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iA08QGHrnMq/tvd0L88F2y5YQ7L4I/IIm3WGKx28378=;
        b=Q9Kc8f2yrVRGFAM8YrZyw5S+gLL3GdK/Tw3iLVodZIw46urko3vpMgJHhAjIPnPOts
         BiQnD0y9OVKHK/iusjwYavdgsTT2ao0PbbG/mgFVMpGrm25UyieEu7Yb8/Q0tp/xYu8d
         IgMyOmkUTSDXpEU38ZVt7Bbr+KZs0lxIMVtUt9np4YyRiaON46kAbLtjAbs8rbsBfpBn
         qtjYx3TzOBg4EYHSj+eISsqc042F8YCZEB6AkfyV1d35grdLiJSLN+Ajuhi4Qaokh8xO
         W2c0ItsZKrL27kZ6NrX7ra0dED3XLvWOAAn9//HD61AOjp9R/AdZz/vnh74GaY6kse9O
         0jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001988; x=1769606788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA08QGHrnMq/tvd0L88F2y5YQ7L4I/IIm3WGKx28378=;
        b=vedYdflAwpQMo/co24wc5C+6XrtIP105A5YNpQkHyiT+nwuaRpGdKWdo02ylZXMHza
         mVuYKPk8z1rxnJ3I1af+nK/BMPcxKUY/9bvLpKKRrBg0d0MQ+rOVtulRomR0+B3NdvyX
         HpMcgLfS7n2dTOlKulPje4CI6vKJri+QyCK6IAYaD5qPOGcmgiVMfYqQy9B/nF1tFYPs
         sTsBkYUYNm/oWS1IEuAUT7Eteryhg9M1EYjZ+kwp+mWt0rqhI1N9GPuWgLVNbumNaQDI
         Kqv/ndRvWh5qK8p/b/v8OehfzCzZdvdFFdIwSqhgrwydugYeo8TAs5D1z+0fSeavpYJa
         CQSA==
X-Forwarded-Encrypted: i=1; AJvYcCWYpyqp0sb1WeJ0cMHh9lPuOrkLEMKVD4yxvKfC3jUMOe2eUUkoUFZfhMDpKwPC/LUZMiyncMzm0jn17Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgtPGTGRhLqFl31UMrvOkb5Yh05I6UzA/MdKWfq23/9av6rrua
	ppUzCbhQsSbCjFjB+IhpzsfdjBaadQCeuyg2IMTYUelWLYyqO0TfGKEW
X-Gm-Gg: AZuq6aJ6QtBlThj31wdtHg6blwGwj23flHMAKCs3HFqiu1lEHUJolmoo81uHCFzm7ch
	ZII6C5f5TUodXTYaT7/zCIDkGgHTB3gZgqa/LwEJaWI+wDjhhBjUUsFlVE8CbGZGNGYHOX4AFz6
	1ishFZj6wwML0oxLBXJHaRbUpK8UDV7IoZrYS9g63jdnBV56W4QYKPsNzxct8QEsnqXMHBGKL0C
	QTcJegWRZTMp+Ttz/sSC34bmsm9w/beyFCgPpKx9yl8GgUrSp8E1mdnH/ecHMt94mtNxoL30ZVK
	bFLEGHcTkLL3SbCuTmVUHIjq1TnGiBvGxCjQEiJrdNx7NU3n30MmJBI+DeQgo9rUUr4UspbrkwJ
	KTxSXsFPxkIwINf31zkJhYQt/cCSxTVmMgAkD0FuLrBQWylT6KWpKLrvpBFr7phOX05MBOJ/M37
	6Lx9jOhuUenii8qFAv
X-Received: by 2002:a17:903:2b10:b0:2a7:90f2:2dea with SMTP id d9443c01a7336-2a790f231ecmr30187935ad.28.1769001988312;
        Wed, 21 Jan 2026 05:26:28 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:28 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH v2 0/5] Fix volume up and add RTC, PRNG, UART in
 xiaomi-ginkgo
Date: Wed, 21 Jan 2026 13:26:16 +0000
Message-Id: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPwQ6CMAyA4VchPTuzTYJgjOE9jIcxutkIm26IG
 sO7O1GPHv8m/dI+IWIgjLDJnhBwpEjepZCLDPRROYuM2tQguSy4ECW7k/I9MUvuZD0zqIZrwMi
 KUuYouEEtBaTlc0BD9xneHz4d8HJN/vAZQo8xqtnfZNsvX/z4G3Wdv7FRMs7yosoNNmuu26buF
 bmOHDm79MHu4G0fKQ4+POYfRjHjX6/6d+4oErzSpVFYlXnTqtomuVtq38NhmqYXM80iCxgBAAA
 =
X-Change-ID: 20260118-xiaomi-ginkgo-features-6824e10fec21
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1928;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=Ilw6wqzweYkqw4rgm0eEkLzCzIBlYAKWRV8Bde+ERSs=;
 b=hFjjXM4oiWiG0Texx/nnnzzFHgGJaQs86B0Q1cZ2Dx0FO3INl8wd4n/N8QAL/fxHV+7Tt2K9z
 2V6bOeUfh4TBuqL3X1lZte+ha9l2V1iWgA3IKcsUqosx6NO8OKdMnX1
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The patch series fixes an issue and adds some components.

Changes:
- Fix volume up button gpio and power source in xiaomi ginkgo.
- Enable RTC from pm6125 in xiaomi ginkgo.
- Add prng node in sm6125.
- Add debug uart node in sm6125.
- Enable debug uart in xiaomi ginkgo.

Depends on:
[1] https://lore.kernel.org/linux-arm-msm/20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org/

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Changes in v2:
- Enable RTC in pm6125 by default as requested.
- Link to v1: https://lore.kernel.org/r/20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com

---
Biswapriyo Nath (5):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up button
      arm64: dts: qcom: sm6125: Add PRNG node
      arm64: dts: qcom: sm6125: Add debug UART node
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug UART
      arm64: dts: qcom: pm6125: Enable RTC by default

 arch/arm64/boot/dts/qcom/pm6125.dtsi               |  1 -
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 18 +++++++++++++---
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 25 ++++++++++++++++++++++
 3 files changed, 40 insertions(+), 4 deletions(-)
---
base-commit: e5d16f0daba655b8c63032f7b0ae1f21881d821f
change-id: 20260118-xiaomi-ginkgo-features-6824e10fec21
prerequisite-message-id: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
prerequisite-patch-id: 97a500cccd7099f84f02d24b79f9632264ff0919
prerequisite-patch-id: a76649864084c6349d5bbd425c84489621e3d950
prerequisite-patch-id: 88844031b714eecc8185b968927ece52795237cd
prerequisite-patch-id: 7f01d4e3dafb4911244d6bf03db9ac03395f8609
prerequisite-patch-id: c339d93729aee842cce74ba1316f5b5c8d01d04e
prerequisite-patch-id: daad11c94235247984631a78b2c2cda74f8af5bf
prerequisite-patch-id: 816740927f2e464864884584e6af596b038074dd

Best regards,
-- 
Biswapriyo Nath <nathbappai@gmail.com>


Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D922BE62B
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947674; cv=none; b=LrQhpKL8A7YFHGCmB0rh1vZ4fX9V93cBpEVm76ju97HjGXCgTu9JKrcUqD+/WZ7iT4y+NuRhZiGtbbwvO8N/zjdhyExZ5SPy8ndaoOEEGt4J/dz6eyS1RGHj0rB4fGj+5eQY6pLGgP+cqFLoKhwpXckV9ohfB8/9HmQ+T1BPcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947674; c=relaxed/simple;
	bh=AQqdMa04vXC2piy9UqiS53/4Xv5soFhx22ppyv1jBes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSOUSZyF3E6numYNVEMK7/3/W24xdG2QJnlrO1ssHwYHVW5+P3V4mB0Ust0LzSwNXnKn9t9OPQ2UGjFUxvmV1zb6+4NHbaYuqF49OIbMh+QhSR3cKVnnP/OO++PPgWt1TL7lrJQAPbbNe0Z3yaEgoYux1P7rfYP5xEu8D4rYVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtdGpqsl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtdGpqsl"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57ea78e0618so204414e87.0
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759947671; x=1760552471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r0xvqxT6obqyR1rkhpk/b1maW+DJaEvwFyv59TGQqp8=;
        b=dtdGpqsl7xzMq6wwN8mtt7OPO1nW7jtDoeXMbdVau17W3agQq7cl35HSsP7xlJGS8b
         P0tIfUiIJKaordFfrYx1SKJaCJRbVYfqnYftLSZIGdUEiLlDw1n+LN9/Qwm2K53qDAjz
         crQYjZLsaj6scjY81/xFilYdQw3xwu5NXunDgK39Aj1sTrnrmEzz3NWNcmOC8N0UP79n
         601NSe9BylRIvauZDB34N+hkwspROl6QMrS/54k6nop/dFFCi5a46ZNBUp5qOsQERXy4
         iB0G4mFRe13L9Fz1oXD67bm/os9sRsZHStb/ZeVDh9WopGVXmxjkhbsXMI8za4dXVfnZ
         b5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759947671; x=1760552471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0xvqxT6obqyR1rkhpk/b1maW+DJaEvwFyv59TGQqp8=;
        b=CkNZPRTyepNdMDxlP3G+h7aif1Jkhw+suHWC/jbqJKZRmAPf/p4XHEaB1hb4bGY6bg
         iG16qK7I9rL1t3Uvl9UpEDbwQxTe9DkXj18VQpKbFdydiI8bG3nIKFDvmm+89aGLvbj3
         m0Kx/8nnRglD82kWwpAHnSJ9bgsqIsNxRvFq0baHkOImCWUOrzd6/GNn48Y5LoUr6FAM
         2v5kZ0WA7wmYkcfvwM04PWabaOssbFY020c6DnMRAHbQQZ3qWd4Q4cRWizDGRctqL/CH
         D2v8msx7/KXd5L3pijgBSfIa1pnpDLzBAbAiOdtATjAIpQaRsSQembiaMF1lD7JINhKS
         3XIw==
X-Gm-Message-State: AOJu0YxttXc3KWFprRjZfCrcMQRIcIHFAuBiEMJ7Uypyv+zqq4ugKY7f
	93qOh+pio1O53AH8p4JrAQ96oVH1gvs2lwLHfQJYShRZ6YrSpYgErk28
X-Gm-Gg: ASbGncu9HYW325v97ugP9mj7Mvpkw9XWwDv1EmDuR50AF0PqbTqcEGsRHAwQptNtFBf
	hSxoaQLYZ6GNaIXhckTYLI0Nf6HsyFAbxwEiD2xXRmHlx/eGoRtjCW7ENyD1rptRhCl3ZDzotjJ
	bbxGmFvIQxFUzouoWqHokxMy7yf2g7vV0Wzf7CPkIywzNWyhNXIJB/BSJeUgeB1f5qDSA5815nQ
	kc88NsHUNeDw6JPeB7kro0r6DJXDmZgDbe2GMngds5GdadAcR0SKG9STZKUZ3LWfc2FZrVn/wQu
	pcY+21bNsThomxLhMg1nxpcEhruu99VpKtVdsnPYjgSIF8rhKp32uWZudDHLvsj9W0Qvrs7g+Yf
	LfAeQjnY1DON8339tpYdhD6BrGWVeepGIJ2osjTGATIJR0WXL/K91FaM=
X-Google-Smtp-Source: AGHT+IGUmDxJhLMmq3olsZ1CaUePrJF77nqg1cSWJUcN+Jh1SFYb8Y4RqO/vHveCQONc5FBDfJj4vw==
X-Received: by 2002:a05:6512:230c:b0:57d:77a1:715d with SMTP id 2adb3069b0e04-5906dd527a6mr1407474e87.32.1759947670361;
        Wed, 08 Oct 2025 11:21:10 -0700 (PDT)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm223930e87.90.2025.10.08.11.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:21:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
Date: Wed,  8 Oct 2025 21:20:18 +0300
Message-ID: <20251008182106.217340-1-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This dts adds support for Asus ZenFone 2 Laser/Selfie (1080p) smartphone released in 2015.

Add an initial device tree support for Z00T with support for:
- GPIO keys 
- SDHCI (Internal and external storage)
- WCNSS (WiFi/BT)
- Sensors (accelerometer and magnetometer)
- Touchscreen 
- Audio input and output
- Vibrator
---
Changes in v2:
- added customary newline before 'status' properties
- removed odd newlines in pin configuration nodes
- reordered pin configuration nodes by their 'pins' properties
Link to v1: https://lore.kernel.org/linux-arm-msm/20250930132556.266434-1-xerikasxx@gmail.com/

Erikas Bitovtas (2):
  dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
  arm64: dts: qcom: msm8939-asus-z00t: add initial device tree

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 256 ++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts

-- 
2.51.0


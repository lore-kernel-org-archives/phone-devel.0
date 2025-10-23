Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4622FB99A
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218956; cv=none; b=smpcJqZSPXoDInm+q8R8QZQpIBr1w4ZfyJH/ha12b3Q514ZmE4ranisxE0dqINQF6uSJCfmHz2yNsOq+VnRqSV3XaFwd+OACQWU0IquWsMhIMSydZEcydQoXI3DzyiVRDeqpW4SKLLdSPCMcnl0/oYSWaHuXQIEHNml/bqg/SQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218956; c=relaxed/simple;
	bh=4tNYoJDwF0/wx0jPRfQTkKqeS3tnPo3AhUeXGnL0Ej8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HKBwYIn2Pl8qwmmci+2IJAqFNQii7qBhrGTbJXqglxxJ/gT2h+voM59+Zoz+sxOTN6PPxIBUUaUhyA1jMqDqS/Wml/tJ5JZPPMOSeWewfjdE65egkbg51SSt14ZOvE+HoniOQuq9NtjZ0LWLwIyQKALaBk6hdetrtMHeHZTtxQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pvQeROGz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pvQeROGz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d3effe106so169700266b.2
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761218953; x=1761823753; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4voNGJwy4uPurf5C4fKMLyqLWdAHXhDGEDNTRqvDsgM=;
        b=pvQeROGzJwv+RBH0ctmaoOKxt7HDF0UQ09ABiJtiSeMRE9YOfIbFaQynKN9keN4TWK
         xu8I1Z8QSAcE+OoL+iLiXVNiMLhzEPUnXIoJ12W9tkX6OfBUtrkNvJtn9NvZaNfe5wG0
         v+Qmh6U2bRZuHdIjEiCmM+pwaKQpdJyoEY6xuRNZFYi4ZiySMPoEtX5p86nvAEFADySh
         /soGr7iLi6BNGEV641kt7smGCRVmz7lQ0egAl+c3PioEWkTjPmBkXK/KYz7I6iivPn+e
         NpFjjUlLzsahLKXHLbyjShg3CT4bHdCTMePRg8Jb/r4lsrQr7mxdV5xEKDeMhXE4YD/2
         OzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218953; x=1761823753;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4voNGJwy4uPurf5C4fKMLyqLWdAHXhDGEDNTRqvDsgM=;
        b=CNnxzOhUjlbVyB+/jfZubtAmtg+lPfqEopBpkAI5VQHhpkGdgLTgTXSFQJSOObVvHC
         zoazs4mNOh4sRmdQAqMF6hE8UTXnBBs967vq263dNGCRCF2v1ogQRcykpwqOUkL0jLtN
         tpQk0X2s77pXXGCDdYgr5DYRCqnpkFH2NUBgDA5GhxkDDwa695u67lZGRyd2A0jjQY5j
         2lNDEG1yqQ0mT5K4MctLFuFizWmMUg1NGIiFUo308vqwUphHm5+WHPBoEBFfiKuu4unQ
         j036XfFoCBo++BEX056XsanyLNRg+hGoxNm7/O3t/wrxtMgIMTayFfQdwCZYMQ4HG+G0
         ZIjg==
X-Forwarded-Encrypted: i=1; AJvYcCXWuiMMiLiBTAdjrNxCUlo0qsz6QGzJVgBxAeGAY5XJaMKWowL02SFnZAOZRSZGeoqXMrmGWdyzXmyWgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywza0dpWH6CbtqmTA3b5g6ZBX2OLwMSuOfU/a6MHUevMA1R2he6
	eSdaU8Y+UDBtNSQ7ktAZyI1oCdle/4GR6UT6b+MCTxiQjITBtY7Qr4hYVvOwHDtgCRc=
X-Gm-Gg: ASbGncsdsaOpcA6ZRYoJZEyQEA765wKRevS7uSk/wdXK50N7i+igIn9abnB3dEI/sRu
	LkIUfiM8hL6xL6SFPtaY6AJ4gROqBBIeHkaoQCME58UDkIM5N4zDf1V7O3xdz6trYjLzEsgyCt8
	JjzK7ODA4zTDFycgRtR3JeAV46+bYaJsaOoGt166LuVyoa65Z2AtTndj21USKZYSWrIDPEYGPfW
	RGP9TIp/7ozy8nhbQzzX+kCVI5WgIrJp+CYNTeFBlanTxXPqcNGVo9Rxb0VlcVN2YiB0kb0P5ZZ
	V5f3N15T5ANnXvaGJ3VwIm/nIE2+WeS0h09NqzOZg1nccwT+0H9oCBL8V6mIeQ/4Rjv5MmZVXkE
	u8gAc9NWFPvfjwG09svBe5xj+uAYOUqWJDu9cxOpuf0f13aG41Ts2+YcX/UbZvW1gqEA8QVeJmw
	VDj17XgciKAIR/nYysTfASttuBk77E78trBTO47icgCtHaPav0u+JwK5x9FRbjOlW67u8=
X-Google-Smtp-Source: AGHT+IECuZRfvC6DsxsoSIoN/FRzObiQXkQqEr8AieICgpNtydyGGfERAFJq1G/Ji9HjhKlMsrkuow==
X-Received: by 2002:a17:907:25cc:b0:b40:c49b:710 with SMTP id a640c23a62f3a-b6475129316mr2600919966b.47.1761218953159;
        Thu, 23 Oct 2025 04:29:13 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb328esm1439098a12.5.2025.10.23.04.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Add support for PMIV0104 PMIC
Date: Thu, 23 Oct 2025 13:29:00 +0200
Message-Id: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwR+mgC/2XOTQ6CMBAF4KuQrq2ZttBSVt7DuAA6yCz4scVGY
 7i7FU1MdPkmed+bBwvoCQOrsgfzGCnQNKagdhlr+3o8IyeXMpMgC9ASeBiMVgWfB4ogIOcqr7W
 xVhlnHUut2WNHt008nt7Z4+Wa4OV9ZE0dkLfTMNBSZSPeFv7CBUjFXoWewjL5+/ZRFFvjM178j
 UfBgevSydK0eaMVHLqa/NxPI+7TwuZF+TUM2H9DJgObTpSlLdA5/Wus6/oE1o0O+ScBAAA=
X-Change-ID: 20250620-sm7635-pmiv0104-34a679937d9d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761218951; l=1037;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4tNYoJDwF0/wx0jPRfQTkKqeS3tnPo3AhUeXGnL0Ej8=;
 b=8Wu8WfcRnpZQY/U1SXdjMJiHfvT8LiSoB16gF8CF9qniIK1EBl1krQqg/zzCYc+nmMRyv6gES
 5ErVok5bWjBBoxA/8zCh4f+x4zVRxJAj7O71kZ5mU1W2VQdTUjGMb1x
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PMIV0104 PMIC is used in conjuction with the Milos SoC. Add binding
docs, GPIO support and the devicetree description for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Resend, drop applied patches
- Link to v2: https://lore.kernel.org/r/20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com

Changes in v2:
- Update commit messages to mention Milos instead of SM7635
- Add critical thermal trip
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com

---
Luca Weiss (2):
      dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
      arm64: dts: qcom: Add PMIV0104 PMIC

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi             | 73 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20250620-sm7635-pmiv0104-34a679937d9d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DD431A053
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 19:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196454; cv=none; b=Cxnvtx89rWlYDEB/1NgC8eyVfC6b3+BuqGwpkyjNIk0ogaSGSQdnL5YPpoVpAQam4jvornAml0pMq27CwU7Rnfd0XCp1P8Xsc5LHJ4sgkJUuqjveYyZHSVL073m/Jqq26b2iVbsLiRAiV8NG4imzLEHOd6z5nq8m+zeCyFXVhwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196454; c=relaxed/simple;
	bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UPn3rA0avKUKYgBZrHJ+ZUuWW2C/bB4hnVFVQVdbaqOBEZSGmY5BKgpEcnohBE1dIkTWlcKZkaJEJg/lh7WrSiWcMp9ozX8XBIRFMq1UG9VBF/yAF1ZSIQknbdwhlzMCdQpg4oqvCq+5RpzkLTt9/wS/a7hM7pkBVjKLsC+9p5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9Df6XDI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9Df6XDI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so3873978f8f.3
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196451; x=1776801251; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=C9Df6XDI5t2LG70YlWVWHShcVMu6SwATtHT8taAgOJD4ExEPXpbQFfBBqLPeN1stev
         QjMft2raDecqiKATo6LvHdfxOu8H1ojrFgtng/kXR2hHoAvERHQ3zFSD/g5h+i2tJgIh
         JDFPwlm8sVbiCo9Wm+t1gDSQ3IWBdo3QSWy6J0syTvAZdFSpNPJ9RSKDTqDhHDmZUOjo
         aTegnwkNxU0pjQTAaFa4f6TWZ6It67syoOkfJ2byIkJR01OGhkGyceDSVyI66TT3LIxr
         LmhNXdPjd053aHZlfjBMLPxt1FMDBLIk5goFM/CjXUWBOXQzIEy7qE20SZSPh/NftrAk
         dpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196451; x=1776801251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=ObwKYd1wnUCNg/2bfHoCH8Bq/MFg1TVMkWWZuIYT/x/NLYiP8ynv7LlDTjnuykJLgl
         CMQp7IbxCsI6KpQRuMqwzkUsDFXMlGsuNO0XkkIXHto8xQxkcsdlG+M4TeD6TMf0KiKU
         kRgTFYPWHryZ0ZZ62MTmWCaVf7kBd4LBK+0PY2e4ztA/7cflqBm6d4E3EDHuSfVzBSWb
         q1mdXcppgExZE65nldYDrYJ7z7inQmFqa/tZYoJnJgoguOrfKyBpbPRNY7uYe/yz1pYC
         8emZZgm0zMO4EGxZQLRkIWeo4DtLLkBSGVVgdv+ZYRS4CVZARfP85vaDaB5sDTXvFuvP
         Imxw==
X-Forwarded-Encrypted: i=1; AFNElJ8PDw4+6BzexbkS6dnJvcPtXZQU9UZPD4L2gysDQbVnTbULYalcV9DexFGwGAwTRFxzjDXgTbnUa5PYpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyrfiDzIXZeXyqFXjISdmYzlzESS1BpgYNbeX/ybgvdO/jFqz
	gIg48EBs/PwFA8Habh4S/zZrF2JBoWILSiK4+6PXBaPXy8EG5IEXiukiLSHZkK4O
X-Gm-Gg: AeBDietSO7TO+INXFlOtYnJNKqoq81to+mnFf2AedvzVgj+bERSxcjxPJOdGin4iKv2
	hXM1Z+G2mjRYAG0TdbqFG8CfSDyz/SOXSc3E7VnCIT5A5rsEpi9kT/MoS2bwKqq17Dl88HDr30D
	WVJLDUopfaXrpdLWEArO6m+6wqQ2QO1cqiIvlTnDIJsGhaY8IW/j6lz7ZbxCjUzuV05LWr2x/2I
	tHSEC1UsDTDrxqqOnNCNYIA8UdPJgNhkR5ijT60NyocyDUKRD7KUXztduDca1lNKEeLAIyqSZEO
	dpSCApfwk/iIAuIPr9g774x2IEr+kmk8fGHGh2e+M4HLYuCivZBhlrrvPwck4Fq9rSB/J+thPpf
	VSW1yO3kEExwE/UeDWMYyOAHlyBW9vau3wBx0tGzLWnEF6B9FoglltcL1tym2Qr4R2tzGlUyfT0
	DP6ZN61H+KTkmsYDE05nQLXzNE8uEPGPIzzccznY+6WdEFFyIAxON5yIzkqytYzO3eZcqSOZGQq
	vqjOWkuPY5OYdvprRtlGT8=
X-Received: by 2002:a05:6000:2013:b0:43d:6fb7:fee2 with SMTP id ffacd0b85a97d-43d6fb80156mr17543282f8f.45.1776196451390;
        Tue, 14 Apr 2026 12:54:11 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:10 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] PXA1908 clock controller resets
Date: Tue, 14 Apr 2026 21:51:49 +0200
Message-Id: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROZtkZ20oryI9sEZN2yA7KhLx7
 pYev8P/76AchBWqZIfAq6hMYwSlCfihGV+M0kWDNTY3jhzOW0OleaD/fjCw8oJUlD7rqcstOYj
 dHLiX7X7Wz7/1177ZL9cIjuMEIf1BIXUAAAA=
X-Change-ID: 20260414-pxa1908-clk-reset-179c3f1d6214
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU6UyrT506i1zu0tp6LJzs5Vp3U3qK48HCC4UO3JW
 fmXrmFbOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExkximG/+6O+04/zXz0402V
 Cn9GtUzGi22LHW9fjRNQlphn4PY24SQjw4qWc1VWy2auDbbLdX7Kqs3Dwmr5e73C9QPfdmRmfLk
 rxgMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

Hello,

This series adds the resets found on Marvell PXA1908's APBC and APBCP
clock controllers.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      dt-bindings: clock: marvell,pxa1908: Add #reset-cells
      clk: mmp: pxa1908-apbc: Add reset cells
      clk: mmp: pxa1908-apbcp: Add reset cells
      arm64: dts: marvell: mmp: pxa1908: Add reset cells

 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       | 14 ++++++
 drivers/clk/mmp/clk-pxa1908-apbc.c                 | 58 ++++++++++++++++------
 drivers/clk/mmp/clk-pxa1908-apbcp.c                | 31 ++++++++++--
 4 files changed, 110 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260414-pxa1908-clk-reset-179c3f1d6214

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>


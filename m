Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793CC2D3EEB
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000808; cv=none; b=UR6yHQCMcL2ck7z8asGhiTUyg2AD6zoB80ye8MzpjnbEW5+PTQOoNMF3VZ20t23tfWIRETzABOqIW9Vs217H805MKH0C5WdbeTuJiSpsITuZ/U06ggD4rtN/ZZrA01iWV8YXZEF/dhz+cfK18ijnd/ZTJzq3ZTp3Sr/62d1M+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000808; c=relaxed/simple;
	bh=qJOv0iN/KQMg4cue3EwWtApI72quYVMhv24uY+typxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tn5KDETAAxdodh1388udq3GXNYntEAPG2gTW12gVOahMRGLsI2vm/qmEYdbxHs6NB/DBxNX810rv7RssBDCyeux29WOj9TbTH/AXPemDvmgy5LVBCTIFD+LFZvttn854O74KaET3d6s6Q6RxMax99klm3DBQI4JqjL41Iv9J+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QBaQGiWO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QBaQGiWO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso1468676a12.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000804; x=1760605604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNhWTQ2jjRZ6dlj/JkxjEi0pSb9RpuzlHQTH6dcdfSk=;
        b=QBaQGiWOg1FZEDRiFa4WLwDaO36Q6AFSkTnuMUuODCUED905EoWXRDqV2IB8Fo9RK7
         n/yb/5+pbHu8aUz5tHAc5CKScQVbG5rRLoGOPYQtr9Xnw8UolPh6PFHV06fdagyI/s1A
         VO6ass0T2FgnFfUl8QbqXbBUQTMLsDFasSXMnBahZwT2WvuUbia/xmXagBIErn4dQLnS
         RBLIvVOMTJztKHPaDnhaC0ll19fnoaES+oZNvjLI9RcZ7YABweabqcZLkKDW2jbFnhAE
         6AjBNFv7TriiS/hCHC/R87y6Ch/K6TrtBt47H1tIg14DhFX2x1UpL5SOFPLRtSNfL6Jy
         kT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000804; x=1760605604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNhWTQ2jjRZ6dlj/JkxjEi0pSb9RpuzlHQTH6dcdfSk=;
        b=ItKd3CwTZ8hgUn43NDVqmcytGaYneu9hCkdrWnnxqeL4QW2GXiW37fPG3rKkn78Pze
         uxGLB6P1mQGJja9mU8cwJXVfbtl9OYwSbw3ZkMyqu7GnYuR7sEH4auJPeNPbhQk2O7M1
         QANbTUT9vid1Jq4VscFi9aKKg64C+Iiz/QX7+D2SJ0UnP12joJoJoP82FHETrYBldeeE
         Q8e1Wjy82K8EGtMimhlM9uQNp2rKZleIIc+KJhXOvaPlBgNvmxtlsbhTvZjT5kCoLJNi
         mDOlkjJINU8T0HtjNohIdoxEhNrvUGX3OYUzm7r2vrn6qtn+APq0g+gCuaAS1KHlpbuu
         8dOg==
X-Forwarded-Encrypted: i=1; AJvYcCXJx3LcgUuaGFLynjMUW7ZJCJTY0U6f3Vj3OMM93PDxnzNx4wCWaWRDfsgkMOtmCmSzHkn9U5TfaTIzRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXCyHPiJAG6Rq3DHfa2mVzz9u/3AP6c5CEBNdAIylw5EL0I0J
	VZjYTGsMmko2HUbVhWDdXoqrVtHLpVYTQl1et9hpwB0IZ4OoAQydRF84dZL7iq4PZQUq77PtrT5
	QqoxMchQ=
X-Gm-Gg: ASbGncs4NsxTf+HeqBTdC575YEyG2lWhApXUStgXRjNRmayir8oCCt/bWxEbFuFjXvC
	fS0s0xmj/KwiZxt9t55vT9f8DjEkiCRkw5RFucn5ZDKzlVbNtFFc5FHgr8Vkj6v7IvjAobni7Wn
	BMFBfH49C3fnAWvWq5+MPRC/UxCMupmUm9RzhK1F/pi3oQpUjvXlHSLBuekupT7PkYEPRPl1Sd5
	JT20XzOepo6+e7FFUE4wj+wDWWWwB5X24yRan2OvZz5ve7wLnb7i6JGQ9Rfzw3amT6+rId0afyy
	jnIMpEE7NBR8D+p8Ge00twCYt6X0lgLHVBXsutIqTSXtL1tihvPocO3w11QpBnx3wH8PpRsPy89
	mXm1BFGx11kKpfmdo5QiEUpuB600zNDwShWLMb5kP0x/eC9ESlMJWFl9qshBamfmc//GaUNFxx8
	/goRCHuREOe3OwzdPvjxkqfo67m8nR
X-Google-Smtp-Source: AGHT+IHVbQo3PobfFCRfWXYrwqODGaxC9rU9vZlXDMJPWoPDWQIzlNupR0cyBhTPPVPrWCFXXZGF6g==
X-Received: by 2002:a05:6402:268b:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-639d5c31e7emr6572648a12.22.1760000804306;
        Thu, 09 Oct 2025 02:06:44 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/6] Further bringup of SHIFTphone 8
Date: Thu, 09 Oct 2025 11:06:30 +0200
Message-Id: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZ752gC/4WNTQ6CMBCFr0Jmbc3wV4WV9zAsEKd0FrZkWoiG9
 O5WLuDq5XvJ+94OgYQpQF/sILRxYO8yVKcCJju6mRQ/M0OFVYtdjcrHSKLMKtHmfAi7eV2U6Ug
 3ODWIV4K8XYQMvw/vfchsOUQvn+NmK3/tP+NWKlQXQ1ob3dYd4s2MLIv1js6Tf8GQUvoCxMlAK
 r4AAAA=
X-Change-ID: 20250930-otter-further-bringup-f9e640c4008e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1147;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qJOv0iN/KQMg4cue3EwWtApI72quYVMhv24uY+typxU=;
 b=sUH9RKnqzC/H1UaTofL2s1bspY4tzj0A5UBraEAbGB/ov8r06zcLDBS7PuxigewegJS0UOLnO
 6nLhLGb1d4nBXl/piRRi7EjIzVdrF8zsFgFm6rFzwo45JSsMfMAdVP5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add some cleanups and fixes to shift-otter, and enable flash LED, RGB
LED and Venus.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Pick up tags
- Also remove polling-delay-passive = <0> for thermal zones
- Link to v1: https://lore.kernel.org/r/20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com

---
Alexander Martinz (4):
      arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and indentation
      arm64: dts: qcom: qcm6490-shift-otter: Remove thermal zone polling delays
      arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
      arm64: dts: qcom: qcm6490-shift-otter: Enable venus node

Casey Connolly (1):
      arm64: dts: qcom: qcm6490-shift-otter: Enable flash LED

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED

 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 75 ++++++++++++++++++------
 1 file changed, 56 insertions(+), 19 deletions(-)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20250930-otter-further-bringup-f9e640c4008e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


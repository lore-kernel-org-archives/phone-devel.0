Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF53A6401
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907975; cv=none; b=GVeisMMpqMOG456KHZA0+j4I8mEWi2YPYJ7UF2DstJI4V5aioz09abHCu9/NzI4hmAAIyEm1xwzjhkwP8+0qDNYy7jOTy0mSmWT3RKOnmVWlAEoIrVH3f/BrmqurBhVH4vCk6u8DjhSy8i8+p7U1bBwOCYBOsPpgYE3KNBXIzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907975; c=relaxed/simple;
	bh=TUOoVZbjO+iFbYwjUmr6bbaQgTh+bqzs6sxID1OEThs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iD3Pem8DGMJLy+BnG8wQMm0x62H4nr5MlZNBTM9MoPWxHeE0o65iK/CyMSmaO4DS04eSeWZmts66vQHULaVhAbaO3goPfGsHHOLGewNLnqCXbY+c2+f9syBFacxVGi31o9Q7tRmVYdEI5W3WJRQzT8EvhqfjzRfftfrt88kwCo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QxEVmRTs; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QxEVmRTs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso6008266b.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773907972; x=1774512772; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rOKIKrnNG7thFoePiGqUSEd9q+P+T3Ql6ZAbLy3uYI=;
        b=QxEVmRTs3kfR+IpXccwtJ11PafJ51DBrAbSmxHJxZPCWPRM611/F7jTxiHhfg7Cqmg
         Ci8Q78A1RQO/1c1UWw0ILv9zbXC74nyFl3ieuieu6KprAOmaN0ubopZlsk1jWjSQV1FC
         zB+KeF2UuWUm5kiV6tPUuS3IEAbBHnd/cfJfVkUGa7qIcDc3/yfdAYwtQv3uDVXFL5T7
         nxKzWIB8R3m6PZTO6tRujQpbktEk3veGYl+EM8oBbB2O2fwyAI7tvU3p631dPBPPJzlF
         p4Uleg6TYRXQH2X0iUeRVd9EW72vNm0VWyuNKwPQLQt4IwbQih4ishFpOv9g5lWMM/S2
         Fb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907972; x=1774512772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rOKIKrnNG7thFoePiGqUSEd9q+P+T3Ql6ZAbLy3uYI=;
        b=hGFgSGlkDEFTdbjT4YBQKDoN5Yl9CxK6fT8ufBxKymc3XmqxYVUw52Z+4A0CvfTAPI
         fgSIpgY5IKtchI0SL6iu4jgFRBCj/LrPs3JZtF7m6Y+qw/qMenrdlvNgbPHfDvSbNxJE
         baI34zLZdRTxiUISh2tJRGlCgINqITSXyHW7XadUPeQTRdcJyXOXaqtazmcSsXGY29OG
         UHeVDDSUTpB7vVbOpSuf59YwbsKALGip9y4xOs320soajFhfnOgKHnspftb2p5yfThQ9
         UatKfncncEwVl4VL1z1S24vrxbzLhuBviHzWT7TV3q6iUwc7Ryq9lwjCynz/gkpIkmBq
         URhg==
X-Forwarded-Encrypted: i=1; AJvYcCUmzW2x35DoD1f/zE8qQacvGIcJaeoK6ogu1Eej6gkarRY7wgA5kCL9xfIWJp0NsA6aFVCXXEMAVRuYdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1wpT2fnoxdqc+76+m1fHAV63i/Xa72G13Gs3ZYC4xlNhMrHj
	WFG0pSU/vYM3ZHxPwTbV6vAc2EetL/WsaExcn2ET00YOMB8QUhS+TeX9eoz+2ooB5A4=
X-Gm-Gg: ATEYQzxu3kMhEs+ZqlaUKKdJ4jGFyr2lm32FgCt8BIgdehpSIX2aA3TtQtEu4OgUzC2
	h5p5BWPA0UisV7bazKB3UIYVAxsq01IwvEmuBsO171P1MWBHrF5hcR/dXFr9XwlNIKfAnLpEKYS
	N0XDpu/p1W+JRzPnluie2pBnJaumw2uAGPa6C8LFT9XsMn+d92nTusNVpCjfWLBkp1ZQb8Sf03v
	ESnOZODFBSx+lfyv2JVmQqsYsAKBnIueoEOzkS+QyyyCof3wCpGX2fxvMY4WTm1ipKrsXcABroe
	nYeD/gy+Vs0SpdvvaiDuLKnm5fBgmdHuO5NsKh4hRQsvt5ZnilSO03/4RFtQT6WxJJ3pZxug8Sc
	7ARRTgMUVjO6ml+l3z1G1dlstlEESIcnScFwZpEQX6244S3gQowLZVvjIlSVoiERv/MLGpCUGwa
	+LzKD11l02puJ/v74J2FxBK/uogK7V86Uad6EgwzfamR/vnDDUblbR4EhHyJWrSlJ9uONGB+yMj
	Edo/w==
X-Received: by 2002:a17:906:6a1e:b0:b98:65e:90a with SMTP id a640c23a62f3a-b980f925794mr144559566b.3.1773907971715;
        Thu, 19 Mar 2026 01:12:51 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm399884566b.63.2026.03.19.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:12:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Front camera enablement on Fairphone 5
Date: Thu, 19 Mar 2026 09:12:48 +0100
Message-Id: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBBFr9LMWgxDLW1ceQ/TBamDjEaoUImm6
 d3FunDj8r3kvz9DosiUYF/NEClz4uALqE0FgzP+TIJPhUFJpWWNtbBjI1JzvXgUnTSd1oZIaYQ
 yGCNZfq6xY//lSPdHaU4/6ThNIb7Ww4wf+7edUUhhzc7i0Kq2xu5gDcfRBU/bIdygX5blDcEWQ
 pa9AAAA
X-Change-ID: 20260313-fp5-s5kjn1-80a866aee261
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773907970; l=911;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TUOoVZbjO+iFbYwjUmr6bbaQgTh+bqzs6sxID1OEThs=;
 b=3h9k1o1poytneYxAr1tewAZ2fG5Ti3jGJe1qat/BypAgCSIEzsNQjfT5dsJu13xmLuOK8uPlF
 nQ+gx93TGFWDVYaeUb+ZSNs6+S72R/X+EnPnHjdFFmLEFthpTTy/kTe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
the camera upstream by adding a few bits to dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move cam-mclk3-default-state to kodiak.dtsi
- Pick up tags, drop applied patch
- Link to v1: https://lore.kernel.org/r/20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support

 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   7 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 121 ++++++++++++++-------
 2 files changed, 90 insertions(+), 38 deletions(-)
---
base-commit: 55154681052313ecee04ce301de6666575cc54e7
change-id: 20260313-fp5-s5kjn1-80a866aee261

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


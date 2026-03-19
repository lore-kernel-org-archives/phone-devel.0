Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE753A963E
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908613; cv=none; b=QEBAtej4EzVtWKk+FBTntdp8ohCtTDUp9fVRM+06f3YwwdXuI3xtSf86Nt05bwTPIlH/j/BCLzMZVODs7B4gBCJNYecYaYlWSEGVou444G5Kggt82yBR5LIRAKmFwHrxE7NjrvYTeQ/crzotULCK9uGPWjEt/uTpSrrrl0hDRSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908613; c=relaxed/simple;
	bh=8OUjEf16Sv4c06kAyALyJjDjDtzADbHjUj8tHoIjBcg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6h5YAyXbu9+ebp3pLxrjtThYj7onSkpB7voD40GKqDktJd+x8z0ev6H/Y067Sh0/bZhvNKeI5KD1lyzFVnUfPh0R0LqE+hU9h50gF8fF72huaoGCqRzbbgtvVv6Yh1hcoSubHhMUXJAoDuY0WdCFfWAvZYns15GJU7t1dCzcOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zPY0WgJP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zPY0WgJP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97a06d7629so49064666b.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773908610; x=1774513410; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKUgfeQ1rM3ElFvN8WXZfRxgDUTYTxbBCS1OUwiotCc=;
        b=zPY0WgJPQ35eZ3Aes7F1QWi/87cbzq2C5pypBhKLKHCiPgiAHTpbafuheH3ewp1HUn
         eJYb2CcWMFxCGdd2qqskA8cGZjO/9nBT/6NCVycZsFnP5nA8aMFZit9NvprJEwFT06ax
         mlBVnWZ5r2fliQPFoGIOhYnTcXtmlY0gUkeCqv6x2ZtTCJtC7r+EP7yBhYSUztA8vlLs
         AB5gtzr7/b1oxPk0FUP3JpJ+2iolX2KW3ptMw103ypIFsiAtz/horaXe966Xc9IUND5V
         MGcaOav2sT33sqGeBhGBFdRBvjX+fQxFDRcQUJnmhZe2s0/VYw/wTetExff/8DMnfqEP
         mjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908610; x=1774513410;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKUgfeQ1rM3ElFvN8WXZfRxgDUTYTxbBCS1OUwiotCc=;
        b=ZKtZB2+NCc0fd03Sykw/G1e6WwVeEltSKVV+jc6ucybmP1cxb9oSUYD0+hxmdpr2FF
         Y+vD9bZHT6TFvvvz0pzXxVZhZyAi0dWjmR/xW15tOTQ4a/vlzbSH/XSDIZ2tsD7Faow+
         Prg+8saK52wtqpwSMunF5bVoKlMrUYJXRukShG/zJkkNQ+ocjnywyYCyI1B+jLA/h4J7
         0lFM2ln8CTYPLOdFQUJrxYzan+CwkuGrAMy06lFe1kfpBW/kJsjl6ivUBDK+wwBfDASh
         hKP74YnXsVZS0vwJSCclYkktE3Ff7yR9oDq1CQl841K9ibEVtnhKxV8dTkOgB9SRTKec
         XD+A==
X-Forwarded-Encrypted: i=1; AJvYcCVQQMmJm4NYnOvTmMh8HtEEC+NRwDoKFh+xS8IAJOsYRusiIjI/tnlT+7hZ1jjpdCLpc7/rhJAVqeS/UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMKBvyTWPgvTEM8iV9hpHWUJrcPjYjCoOEU1GtcJcyaypAIRLt
	zrpPhEMJfLt24ORqoQ6Oi/6bkFDOY52J9T18b3zFWF5v3Pf6AGwVhF54u9kN5Gxnf58=
X-Gm-Gg: ATEYQzwEypDfKAghw89uwj4faVSA2VJLBi7C/a7r/z8GMrteMFeJtRD3h1rz+9e4uZi
	IGzP/gnjzwTDVBxFutrWa8LzykifHX7d087UYs3E7Nps2AvhEBJuTlHiaZhAe5m4ot98gZUzMsb
	uXyRVXsvy4vzIpTLbRPB7dk0kJY+mS9W3ecnr8G0lVWx5fA+17nQyDjCoaU5b16bAt1hRC7+ShQ
	YamnUiuIK4YMTGjcGMCeY5d+w+j40yBU164K4FOOVvBEP51hU8uiyBcxxmqUa6iP4eb65Dl1S+4
	5WtCr4Yl4NcN8VEKTcIR7TVGsPcKG8ztV1z/koeQP5c+MtBLPq6001Om6ZXpmvQa7KJ/+HnGPkU
	40qfg2F/kQWYUpWt8XdziroS+1azXVBUa0POI9LcgP6iaj9hE/gUm94JF60nGiDKyEeItuZFvsm
	9eqik3stWovj2Npe57+X4eJyi7rU4nKQwEL4i5Ej6yCb7drCOwRvdieSGvJy/Jzg7mWgy+F8wKO
	lxaQA==
X-Received: by 2002:a17:907:3cd2:b0:b96:e0b1:ccf4 with SMTP id a640c23a62f3a-b97f4ac5c3cmr415327566b.47.1773908610177;
        Thu, 19 Mar 2026 01:23:30 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cf16sm419743066b.20.2026.03.19.01.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:23:29 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Enable UFS support on Milos
Date: Thu, 19 Mar 2026 09:23:17 +0100
Message-Id: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OQQ6DIBBFr2JYlwbQiHXVezRdIAx1kioW1NgY7
 16KXZgu/8+892clATxCIHW2Eg8zBnR9DPkpI7pV/QMompiJYKJknJW0w6cLdLKBysY2RspCK6l
 JvB88WFyS63bfs4fXFJXjXpJGBaDadR2OddbDMtKkzXlFvkCLYXT+nX6ZeSJ+s/IwO3PKaHmph
 GoEM0zpq1Xoh9b1cI7uZJrFgebiSItIm1xDYUtuWc7+6W3bPuf85gMVAQAA
X-Change-ID: 20260106-milos-ufs-7bfbd774ca7c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773908609; l=1012;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8OUjEf16Sv4c06kAyALyJjDjDtzADbHjUj8tHoIjBcg=;
 b=lcyO/YyTDYQvlFsL9R2tkX9hgH7gkjIBuoyMaUdqITm8HaxUK+opvZ76XJu4TJHSx8T2KOuqO
 OXVPilTNok4CyTjB5OBzZ17qnOAa7x06q8WTSZ0959ViT+qJ0cYz309
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add inline-crypto-engine and UFS bindings & driver parts, then add them
to milos dtsi and enable the UFS storage on Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Drop applied patches, rebase on next
- Link to v2: https://lore.kernel.org/r/20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com

Changes in v2:
- Add missing dma-coherent in milos.dtsi (Neil)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: milos: Add UFS nodes
      arm64: dts: qcom: milos-fairphone-fp6: Enable UFS

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts |  18 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 129 ++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 3 deletions(-)
---
base-commit: 54526d6c29ce58d5399cd4e2237d631266ebaaef
change-id: 20260106-milos-ufs-7bfbd774ca7c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


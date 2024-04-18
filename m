Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60431E48B
	for <phone-devel@vger.kernel.org>; Thu, 18 Apr 2024 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422239; cv=none; b=LSgeVMaAaOL2A2Ae/0RCoXsykB14Ojc6m71FHkdzUxeCafXdhlSmzsb1UeBuigWjZ4xfGxirbz5dNSMkrPNVIntqcUkz+BnEyWD50G2+mf2n4xf22xKQBGmGu4WcQbEZOwjmgmOKbQXdInvI5vrh1ynKmki7HvC3T4B3ZYc99+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422239; c=relaxed/simple;
	bh=AZORWu8R8zYeP/ZFHg4EUePNoeAt6LSIC3aOkhrqNuU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DRNqi7Cnv39hJeXVKtHWffXb3Vvx+Ogc3gZE6032hDsoHBA3EXnsBhnE1SKjVvXD8X7VMcID/GhCpnMkNTZFKVeXPUj4cabILjZgTvwwDo/g/pZMT4LrTHtCirAv3oozbb1I2G6O6r3xA48SQIxU6RtI7fcwNrQ5qivcSPACX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZL4kamYD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZL4kamYD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so567274a12.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Apr 2024 23:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1713422236; x=1714027036; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llTPKlZu+m+rPiTyn8KmBYZdyOU2ppQM2B/d4Fcas6w=;
        b=ZL4kamYDnq4I/3sMTFRWPqRnenMQspeDCSZhKvoKuMzWRBpw2VAdwPRYk6btSq7z10
         noUn2UqPQDQP7NcimdPyyoZQt45m93n1wBW+7D2kH8txQn38uuDCIfqwqJ0wom8oRoBG
         DXS+c5cEKf9QGI0dLFSfnsjsyJ0WhhugUYT6kzI/4GCOxkimfyy7ifGgtRiAfYJu0V83
         SqolXRS0glH1a0EVXhy6YTIrm4Y9r5rpwgALSqISGlqklEVTfCCE6RPnV6vWms91KkdT
         Y5xRUVlhIZYi6CkXmShKsFJssd5pWkCxwlx97HMYGr46cluuew+duQRzfc44rbR2W5kn
         Nb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422236; x=1714027036;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llTPKlZu+m+rPiTyn8KmBYZdyOU2ppQM2B/d4Fcas6w=;
        b=eWZec4LCQKWWq5KYoDo9cxn/11ow4tjZhgV9cLl/bv+0nb9A2xd5E2h6E29v69kH0d
         DkvmTrW5GCccy9b3z+xQRyTxGi1B9KxJsJsResLa3XpWNqaA5z+G61VMfH9qthn6KTOJ
         AkwdqPUI6h43PfAqDt05KIqKY9aQiywIfZ3KexKH1Rr1TLSh8dqg1sGAhSaIZF6lTry9
         +eNXCYQEBYyktxjQdqGuMpIyUCsw87vfvV/nJDV9Ae5/GSmVfQwnV6xLDanj0ELbMnkv
         Qn905B4SN0QhhtS6BeP6GRKuy/lFV0eGJOp2LlZ/9G91HGH77DTPMdRLIR+edDGEepab
         3hyA==
X-Forwarded-Encrypted: i=1; AJvYcCUqd3HfTBr7id/gmcuJEzl+dfewg3PUDQQwnyqZxsW1Twhj4xswppXVOC1RGaIEjuGzZLtdEkHMRue9f7cI+wfBQwlahGhlbpiDZIo=
X-Gm-Message-State: AOJu0YyFXzYu5hafwgHE2O1DYM0zvnSLMiRDzNRRMZHKeZ3lNe7Idocz
	W9iuOqnkYVcfRHxEjLcCbmQW6dSPgwHOHUGXsw8npWrAR/F9G0Lg0U1SY3J7baM=
X-Google-Smtp-Source: AGHT+IHqtCV++Wsw9wK28VHIK6gcb8fIo2SrGPjBtDGKkrvJzKQWMEY51hHoxq1zqO+rtWtMTTyGHw==
X-Received: by 2002:a50:d514:0:b0:56f:e7b9:e67d with SMTP id u20-20020a50d514000000b0056fe7b9e67dmr1671298edi.12.1713422235845;
        Wed, 17 Apr 2024 23:37:15 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cf8-20020a0564020b8800b0056c24df7a78sm472277edb.5.2024.04.17.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:37:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Enable vibrator on PMI632 + Fairphone 3
Date: Thu, 18 Apr 2024 08:36:53 +0200
Message-Id: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIW/IGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0ML3bQCY92yzKSiRF1Di2QTAwMLC0sLU2MloPqCotS0zAqwWdGxtbU
 A66ZMc1sAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

With the patches to add vibration support for PMI632 finally applied,
let's enable this for the PMI632 PMIC and Fairphone 3 smartphone.

https://lore.kernel.org/linux-arm-msm/20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com/

Patches have landed in the input tree:
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: pmi632: Add vibrator
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable vibrator

 arch/arm64/boot/dts/qcom/pmi632.dtsi              | 6 ++++++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 4 ++++
 2 files changed, 10 insertions(+)
---
base-commit: eecc5d90861b551d3b8fbd0d0e6f25c40496f3c0
change-id: 20240418-fp3-vibra-18c400889853

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


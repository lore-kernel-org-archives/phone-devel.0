Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FECB25D214
	for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 08:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805669; cv=none; b=dSZYsY4VxNQSbT4pyFEvTOot4LVCX+wWkwR/yG0hQYxswVWxd0JIJMzxWKYGGo/bu5qFNTc9WO0az/IJ36hGP4SUKVGbdyMACMVPfup3wbzRTLvt92HfDJuaXOCCYyuLmAhGKgFwpZUqQi7DIpYl2TvNphMiHeSfclJ1eS5xrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805669; c=relaxed/simple;
	bh=+RNPkMlZKx3NJ+3YCG0FD3p8moXxVtBHXDEF3timP3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CanCqEEWt7DYKQn2hSoSq62nPxPDf/5OWyhHs7nhlB+UBAXDIjIdNuuPaYN+NV9QRwnL0GVFusyS0MqNdY4R7AwyONNlZNWxYyttKzpKBRutPxbnEWeOU4gQi7nEeZIYWRjjQvNId7siZ8buRRP4NDlUgAuEReZKdjOPMuIRR7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ba+Qdy02; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ba+Qdy02"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so5333353a12.1
        for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805665; x=1743410465; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7yAl2Q0nLohT9vZl0hqyj3prGYXo8JS24o94BwYJufQ=;
        b=ba+Qdy02uHb1RVsCeDccjjWm1PH8tFtVpzS5K/qXCPc9aX6eS5dT77gm6UK+HRxAG8
         jSEz1Bb9t5NM305dtn/aHISC7j1mxtqvhMKYbfAwoyGgpoO9CGTbKkhTslIxGTh5E9zR
         B+blM5r8G96OvqlQgNcbNZ7c1gHd9fjqr0x17a1B4KYn7EAoX7G7jutBcON5YOTStc8t
         c6G1SC0bbDq0EA9oDiWAu+3eT2FhjgQdW3vSvTj8/4sLDDAi540N23m++8WdOMjUV0ww
         f0SxSxD0odp5is+7WOVkszRl0mh3LSIfNHlRlynGxtm/Eq+Kmk9ryuZUtsc69XR2+zbD
         Pzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805665; x=1743410465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yAl2Q0nLohT9vZl0hqyj3prGYXo8JS24o94BwYJufQ=;
        b=aPQ4n4yMGjszhmEWAR/bvaomQJga+Slp5Kyf3w2pA2ez11dmdPQxlxkj1ZiCx3i+4e
         XWf0Ff5pTlQtldUwWkJGvWUJf+fxsCIKdmcixkmLsaUbRScWUGvPiimVI1KWuz9TkRA9
         FgHLo0OOEvsQHl7jrTwVhaR0qZm+AEOlUPnWhN/lrb/cWUwOs0ltNtE6Zh5918edRMyT
         JaixkR06JWNCg7ZCp+aenp9GmcfEdtYPC1gQLTNzRgL0nQQKo7BvmP0zjbOcncf+N1FG
         dBKDZLx8U10o+jzWEzbpjQCey+kC6g9avxIBrYpIC+Gbdbc/vBALOjrvaWFCKc2L+UXU
         RE/A==
X-Forwarded-Encrypted: i=1; AJvYcCVlLwYRelB6VoLCG41Or09atlhuwSRAnQUH63nmeBAxZpd+UgupYxnc6oRaC5MbbDPlA0F2kcjZSwZhqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8T4r8t02TkCsLK37ULvsqVKPUIJp1/TemELs0Pg5D0u7JeznZ
	zE+XEYZICfPkCQH1VoSSJABu5YDjQ4/yWQeDHjId2nc9tR2x4IEi3as3srzl8k4=
X-Gm-Gg: ASbGncvr9rmnitKyNZUhq40S8cuBrwlmUuaDJphorsOgDnF2lPPYDJPb1J2MsLSmnCN
	AYTIt97lLmofGiSYDg4Dgjavx0Y3bpYlSGvqpdm9DtQvF52+XFjBLgGzGAOK3joBbYsEfikNSUN
	16MgemzXceZavyaZYwuWYkw7zFDEXlqtEkUd2lZTAdPPe71xjWciyoNCkocNHZEFRDx/jzmXk1s
	YwE7EGyFW65U0+kSFjOjmKJZ2Pg7W8wPnBZnF4PxXWZBFLoH93zW8Fl7FnBtr6rRCUDP4DTP6j5
	/J8A4B8GKuOfpU/1vwn9diPrw8S1GNcg0+ZI69LJimktjehNlrgUjtuTaMSCBDbg1ublmmxeXgu
	3XNjRIR1IbVQDuZHBiA==
X-Google-Smtp-Source: AGHT+IH2pFE6i0Zm5wyOinKwndN5SuBfWx9dBH2pv1rqCqFeE+5G+h9xZXN6o5/fzRd7duxeGjB9pg==
X-Received: by 2002:a05:6402:909:b0:5e6:e68c:b6e5 with SMTP id 4fb4d7f45d1cf-5ebcd51c105mr9408156a12.32.1742805665487;
        Mon, 24 Mar 2025 01:41:05 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfb33sm5715937a12.68.2025.03.24.01.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:41:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add video clock controller for SM6350
Date: Mon, 24 Mar 2025 09:41:00 +0100
Message-Id: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwa4WcC/3XMyw7CIBCF4VdpZi2Gi9TLyvcwXdBhsLNoacAQT
 cO7i927/E9yvg0yJaYMt26DRIUzx6WFPnSAk1ueJNi3Bi21lUYrkefeWCkKe4qIoif049WN+mx
 7aKc1UeD3Dj6G1hPnV0yf3S/qt/6lihJSoEVSQZ0uhugeHKd1igsdMc4w1Fq/6e/4LbAAAAA=
X-Change-ID: 20250321-sm6350-videocc-6ecdb9ab2756
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

The driver for the SM6350 videocc has been lying around in some branches
of my git tree for a long time, let's upstream it. It doesn't get any
better by letting it age!

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix an uppercase hex in driver (Dmitry)
- Use hex numbers for reg in dtsi (Dmitry)
- Add patch to convert all reg = <0 0x123 0 0x123> to reg = <0x0 0x123 0x0 0x123> (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com

---
Konrad Dybcio (2):
      dt-bindings: clock: add SM6350 QCOM video clock bindings
      clk: qcom: Add video clock controller driver for SM6350

Luca Weiss (2):
      arm64: dts: qcom: sm6350: Align reg properties with latest style
      arm64: dts: qcom: sm6350: Add video clock controller

 .../devicetree/bindings/clock/qcom,videocc.yaml    |  20 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 218 +++++++------
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-sm6350.c                  | 355 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    |  27 ++
 6 files changed, 528 insertions(+), 102 deletions(-)
---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20250321-sm6350-videocc-6ecdb9ab2756

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


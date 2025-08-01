Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829E2E371F
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056279; cv=none; b=AhXVH/pisowD2HGRbG1g2wVpOfALBEUm/U+016UXEW8x/tVOb3MjalEuN1CALZJGajxuiNjG+OVVk0r9/5YW+5bS/8K5aoz8U2Y+K7isO/15AHUlkV2Q+IjETkHSkUXruflC+VkZJQ1fhevhlJ2gsZH5DtrikKl1Il7/E1XoKpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056279; c=relaxed/simple;
	bh=f7DBa8aIM87H/wznrMRy91TdwWbPJ2VA27y904OF4cw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mbegd0yOENKZ6h5V6OFPyb31QuzWXgPBYgWOS95c1pEj8pP0vVyIkYEvq3U8Y+M78fUiIy0AtjVgclnTRvZ/qewLbbgTmXHcnxibvbuEhuGRQ2rNax/1Pct+N5B1JlRnP7yLMu+T6muK7b4q35sob1uN3dqEEBxXgQu7pshMwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O+zI18Zu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O+zI18Zu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6f6so2832777a12.2
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754056276; x=1754661076; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0spx5wifJ5o/D9V5nFeVJSpM5aEaHKsTuID1NTIGBPw=;
        b=O+zI18Zu5YXEZfqwfqjUGp4R9L9ONgtpB/53e3kluxKibmNwNHKfwUuFiS3BOjVM0c
         2zWGGdRw8CInmtFHAaLj0lQ43IisbM2461R4bw+b/FTc9O9R4T+UdHzrDxSIipWgel2I
         fjctY0ZPI4dI8x1mOfwvzrrCSvn4xJ4/HlBxiyInct9hPoM1+zOmgApMDv47TK/nGIVf
         FAhpD2gHSAW8g1YDhY3D/fvCgTo6xQmBrR3AiSjcAkqQEgT3wyZ17nJ2dqyfUwR/aTr/
         vHAMkpY+UAlLYWb0kZISbelb5Z3+3jl8t8fdqSGoupppFfOqTfVcKTTnZhhPAl+zMD9g
         oqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056276; x=1754661076;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0spx5wifJ5o/D9V5nFeVJSpM5aEaHKsTuID1NTIGBPw=;
        b=hsLDw4gLvRD8Wsvzl/+wH45VUJbCQ5oOL7iJ6oZmyXV/+irwLx90lMfGg2HeT+85R8
         HKE1MtE7qSvrWCl2Qe0jm0qr4gDO1XDKQaruPCtOP8WfvaVQdMPFbRNW/uDcQRVlCFqb
         //7Mh9t9AeLye5oOA0buuyeV4BlsHBXc4Q04sPaxZoDXXBPrRzGfhxAnjcN6uwssLNMG
         nqlRTx2EO0I1oZHxBatjS4MpYdHREuWl64kBnb2lVmhE5JcQVN8CQL333RJAC+G/uIUf
         ZZcQupz3qYXAAA8fDLKWIBH6Vh8aA4kcXyZHEfAyNhiNJeWMvuYxUZD6+PiBZQ7yeS/K
         kL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXSeKrbWyPBR8nslTgajMDkorOohJNsh+MdSPvJg2oMqQ1GnAu+XaRYB5SwqYo1xa+6JGqAcTv7t5I2qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmcxoyw6wLRdloO2W9EHhqwYg2lmhXYW68r8KuBjq5VbG05l0B
	+u9SbfmDhF8DYuLQGxMd1XsOaAnueF2sVyx2EVQ9GS1v/hNqnwu1T/62//lahEBPGiY=
X-Gm-Gg: ASbGncvU5Fas8V02sRCqxdhr2njFSCkssWoJqQS2RZn6msmXUK6Ufq2nJeTtN7dJIuj
	cszcTH1mFVYTUALdoVVg9uLzNx4UE8FwDJz6rx9+3RCbQgwyf9i/Jo4BN/aXDima8Us9jMtkvrU
	uhkoxc6WExH9g+zwljOaU4z18p3ZIVJeGGia8w8QbPY/eSvZpr6bVerzBLFHDoEROPwOLZgtqlG
	SowNlS+AhowgYImC00cZmjmd365QS1Jy7ZuoWwytUDCep/1J4amy0FFfHMzS5Hq4O1y4aqECcjD
	teIo6M51KXbxJKtVKc/F/QhGpGNylqRmj1uOI3ZTZcsBBE4D2nzIGnZsMR22SEqv3iHXxK5poYp
	hg49vRTnx8eLG0h5RdndgFMqyObBGYe9SDTkpmck//dHf1bEjV22sNEw1bacRE6+KtVwT
X-Google-Smtp-Source: AGHT+IFBFj6qvGzUA5TiTKTtAxzZl8bkRsQ3p0gCkbRYNJdt2Y5ggC5CNo/vrRAuqRiyHKdxaZpFig==
X-Received: by 2002:a17:906:f59c:b0:ae9:8cb4:2fe8 with SMTP id a640c23a62f3a-af8fd97327fmr1229928766b.37.1754056275571;
        Fri, 01 Aug 2025 06:51:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92a2ec9cbsm180542266b.79.2025.08.01.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Enable USB audio offloading on Fairphone 5
Date: Fri, 01 Aug 2025 15:51:04 +0200
Message-Id: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjGjGgC/x3MQQqAIBBA0avErBtQQaiuEi0sxxoIFcUIxLsnL
 d/i/wqZElOGZaiQ6OHMwXfIcYDjMv4kZNsNSigtJiHRRY0l72iK5YDBuTsYi8rMQk8kZ5IWehs
 TOX7/77q19gE9UTaxZwAAAA==
X-Change-ID: 20250801-fp5-usb-audio-offload-2a9058e19e1d
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754056275; l=799;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=f7DBa8aIM87H/wznrMRy91TdwWbPJ2VA27y904OF4cw=;
 b=wBSDVtEogu9N25o2CPepXLGCoT6+KbcgLLShjuNNC0VyjNyRpb7ur/7QnVvb9rce8bRg3WrjI
 kOReUgGS88xCXUk4kCg4hK/jJqMNY4bRN0hc6nmU0Pu0sfGqzRW6qOM
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to Fairphone 4, we can enable USB audio offloading quite easily
on the QCM6490-based Fairphone 5 smartphone.

This allows to play audio via a USB-C headset with lower power
consumption and enabling some other features.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sc7280: Add q6usbdai node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB audio offload support

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  8 ++++++++
 2 files changed, 24 insertions(+)
---
base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
change-id: 20250801-fp5-usb-audio-offload-2a9058e19e1d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


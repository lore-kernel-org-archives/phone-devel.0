Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320A6291C23
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842816; cv=none; b=Wx4OuCAdEf1XpeU3PhkXFWuwTI6Bs53ic/Z2pBybvyFFuML+CD69z62bqFjVJvOp1Qs1LCk7Yr0WFHf/qaEW4CcJr+oJrAR17f8T1mOnZ0IeES7zcQRTF3fimMk541EO1Lvp70M3xdapy7WPoXKdEpbf0fKPKhfVKwSxqnrqX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842816; c=relaxed/simple;
	bh=4sR5fPpma/GrOJli/eLiVTPPr/9TVkwqVfopkbkw2Yg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pXIDlWV996hKntGWD/0EY1uWnkZIe9zoqUzLT+8oBy9syWZt97js1BzYL2XSTizg1eUCQmXX7iIFSS7NLk6QpGojvq1XolJh9BwBNl2t2NRe9kfWWl4v9xermLbQgs7OwtWLbMEChJw1v8N3aLleMKNqAb3yUv7uLzSMyQMhLsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CandxWgS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CandxWgS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad883afdf0cso256491866b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842814; x=1751447614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ks2KgKPEFickNI0g8cLhP0+7PkHVzo+kxkQrWM9s9Jg=;
        b=CandxWgSEa4zslHSRGyTO6dsjXvFLFADwNBqczzvZvsMIgh29Buk46VcZDX8xeg0Ve
         SNE3FQcpEUor9G3ujm8oSMA/zk0ior8Gxc7scTMWmFh0J2TUp3rKu2vOzkVehQEwuOef
         9k/V43W9L/DbiPEMV4PRyKjJKXspK0OGtAiAWaXJ7PpZWga9vUVSi8mQN/hWAhyOMQuH
         QFBmHRXNiJ6LotIPeHhnp2BNHTbmX3WIAGYxsCTT3AAYIzrY+SPez1BcwDATg13wQN7o
         dnrlZvgpYqzOEyx3Oj3MbdHTkKDdC5+OcGOFSjDnN0bKO7sDqq6zuRJsRgn3nQ3S59xU
         Favw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842814; x=1751447614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ks2KgKPEFickNI0g8cLhP0+7PkHVzo+kxkQrWM9s9Jg=;
        b=G5Jr3O71RxT5cUcke1h8iUUMRdoreDtyJ7fA1kbWCpjfO4CVZEG4bQJ1+aOaYI7FGp
         himNKIworKrZ5jKfYW1FYDNgAeIWPKziqmH0+WEXzSGTaYBjr1DteKV7CYsLxeFFQtS8
         F2qNX7Z3qXStoaaFCY+gRrbAIvGJxD986G5qJlwmLNkQ5UY0e1rHyp+aeXGj+iB2bEUl
         jEs0nacC0TXl+lNuSGlggMDgR9Eb3yBuXJuVwwKmJRUKVbfU4D8eOkCVj8507fHYbL5m
         RjKOOGLUvAf94ifUfl7nyggo9rES2XEoVfUNdKd6mBba+7rlFj8MSpU52+Hhb8FLU6Sl
         /PiA==
X-Forwarded-Encrypted: i=1; AJvYcCW1vo0fZ2tRRS6qy7eiie8P6me9YYhwnkl7DXEpovqacIrH/WIfpAPsClpssC2JJCzZHvNkd2FVf98cwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwXpO4hELclcodHt9NS0z5eujoPjTM7DTYOn1CEwUTP5wKM2h
	k4Ey98hM90+99+D6IhXcbU5+ME78JRZOW8W/Hx2X2n61c9cYBvjeZyBSgSuR8qjeOZY=
X-Gm-Gg: ASbGncvrTvlft33gJFhdP6RXxl4+N22m/wf6jG4w3Kd/LB2+mTs9usk6swxSJRlaWA0
	bopXX/rujZ/QArbD7gI2iGn5Tj3/+tOve3nHFgVNrOK3n5Yne8fMAc+NBebm0HHCtuf1k8fLKnA
	SZqkqZzWZjvW4Www+nwne3x1MhDNofjU7KKfrHDvIZjZ0cQPLP0Uz7hDDmXfWn/VDI42OsneRfY
	01C0M82BXOPmfqkYrSE15S6zZPsQjGqRiACDm7Y+kUdoB/+MRxfMQA8I7QF4oBSzlrajrCJqB6E
	GnLAVHE9ubNb8fnPDIVnmUXekoqdSJRcOKM1aFUwwoHJs20GJqj/yEUSGyMCTtoVHQ1FYh/X4ZN
	JMkxv2gEF8YDMhjSKzBAHhqjoWx4JOlBE4KuldxSeyh0=
X-Google-Smtp-Source: AGHT+IG3W5RmwW0KXa53tzqdC7aGtVxDcyIrcDLyCjEyycANLI9U+Z+hJ/jXQi64INJPHjABBmW7Xw==
X-Received: by 2002:a17:907:7289:b0:ae0:35fb:5c83 with SMTP id a640c23a62f3a-ae0be9dc2c3mr227506966b.28.1750842813609;
        Wed, 25 Jun 2025 02:13:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm1002786366b.128.2025.06.25.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add SM7635 RPMHPD power domains
Date: Wed, 25 Jun 2025 11:13:22 +0200
Message-Id: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK9W2gC/x3MQQqAIBBA0avIrBPM0KCrRItyppyFJgoRiHdPW
 r7F/xUKZaYCi6iQ6eHCd+wYBwHO7/EiydgNWmmjrFayhNlORuYUfEKJ7jDolLWONPQmZTr5/X/
 r1toHeTYSf18AAAA=
X-Change-ID: 20250620-sm7635-rpmhpd-dcb5dc066ce2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842812; l=624;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4sR5fPpma/GrOJli/eLiVTPPr/9TVkwqVfopkbkw2Yg=;
 b=8C1xOSR+fZgfOr54HLuwAQbc2nKk/SYaba1UqxJmSlY8b+huwWPWF6bTrhmee79uk+3mUFy71
 0mNZhETK1znDIZB43YvACA7IC+galriMioJlCwd9mFhd0P0OjvZYVvO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the rpmhpd power domains in the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: power: qcom,rpmpd: document the SM7635 RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add SM7635 power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


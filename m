Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2E2BCF4D
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843130; cv=none; b=e0gI/sL5cXZ14/ELq9cf1npEtQ/E+W1W9Ci9yHicgOEwyEeLxFrpEyAw9Y4/658uqf8BsFWmXGG7jxQZhyuqrBAFqGgjsxGrVyuDcdK3huDPdAR7PwHpWu689Fcb4cXSGXJPbU5+erKJk/I5DJfN0dWXcBbq1fTj9u0wSSQgaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843130; c=relaxed/simple;
	bh=bKa5pgN2i6WIOfNTB+lQHR7lOH2QI72NCfvc981xeY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PPE+6DZRYFQwzwWL6qq7UC905B++VWLJ0UOZx2vdqWigmJY6HNDztAK3oSde2ZmrE70hombSjEFgwOtCyvuTTw31OcmhovVafeEIK/sGBO8OnGik0phFjJ9J9jlOWj3USOhCBfK6+KOsdM8BoudJR0APVZZaTbJuxhWODszRTMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ENCC/NYt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ENCC/NYt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-addcea380eeso1032304566b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843128; x=1751447928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iERbP3N/EQif4yPHwjfNiSXoDkXWDN2BNOK+TFkqrQ4=;
        b=ENCC/NYtim7wD2BmaoJW7AZQp/bPvWWfcx7WMjv1lJbuytSXqzMff+vwj03zbceXXF
         1q0Q4dNhyhrcnr5DcBi0YI7s70orWarLOER+9B1xhjCMRnhNdHQXU69YsYEnhWsSKZDW
         PgVOcmLQ6ZzBMBb/UmBGCSSE5Gi8uhNBItPr0ES35JsOZu34eOcDwDP/+ZCfoCnfH0lZ
         KE2BSLgOvEQn+NB/UIEV0uselseOyjndI6KYbPO2o6xfj47rN9TvzyBiHbvrK1lH06HB
         +JYR1DtuMh8ImV6apY+ljBqvxdi0jWXA4SLwxC2eciw9tQyZ1PO8IPOWC4gsjUzi9R3y
         2ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843128; x=1751447928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iERbP3N/EQif4yPHwjfNiSXoDkXWDN2BNOK+TFkqrQ4=;
        b=U3+RVbuRdC7i1Mn/sijb6u8YyBIqUUauj53y1b6kNEaD/Bq0DU/8QvrXY5GoIqXhHc
         r1dNq3vLCnGGd80cvA5owg9nAlJg0UxdUANesJobKDXjpDdF5qb7JGzTHJHeh2tAmPR3
         bGC89pJE4/8DC0xjHzcVriZrmtNqXFZvahxBiS3iZGaQ/mKo0Cwbu751AmCKslcG7Clh
         35qprwLBnURtUDJ4vfQhPUXbONnFlBO1fsFCVp18PfpKAnVi/4YaG5+mvYRoLKyl/Dll
         BY3Pu4h/TDUa6uB5Y6Sc1Oy50Rig7BmStoCU9S6jgkZVAupaUlDhAvYHmL+yJkf0Q19Y
         l2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5nwQS/j8TKWE+wek4WAFWdkbGqONP8J8hsSvKIiiDrPvUovj6qtazb/nNKG5U2NSUXHVvw3QzH+0Rjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFEAvJAIhhRMxhchqI0noEmCqR5INaiftZ/y6D+r0jGIEBQXm
	ImX05JdfyE+QopsOQWu9LPtttZKlLvyOGR9BmdQNxpv53+A/HE4GwdoSPKWygCpQQpk=
X-Gm-Gg: ASbGncsvCFIchij2/t1ceyq07bFvYSQ466oW0P6YHu0wttKIaZHgYNd5SJgRVbVseYS
	zTkjZ/sXE+my4fEs3cAAaiYwc8EuwD0rFNyP8zoS9/eZ+iW+JRO5oWJru/XzC3AG6bQGbxtBqZG
	xhiSWYcxh2WHSZt3SWVABFLQddWo3m/eGUe5cpxjbrLeWEBFCAOEazcs7SGQXpqkkujHQYvH6yj
	0KwWpZIljWGAOCNc24qAKRoBHs6Li33YEYE1Kxw0QB5NSZw+LM13/gRMdSbO3VRSaUJM1qBiRKl
	tKQT3By+DGUEx8rHN14TX2BB00DDNACavYRPC7swQOPq8F7C3xLZ6c4JoN/R46wtW5xvAHINPzo
	3M7xjHAvQOeNUyF6G/N+/PZ3+t7cSuVqYE70EE65BFkM=
X-Google-Smtp-Source: AGHT+IEcXpltZaxXDWL2kp/EpCGmt9a4hNb8S7GrsZ3BBF+s258ulShYsTeMQ8O+FZoVYQ84ZMXxkQ==
X-Received: by 2002:a17:907:97d1:b0:ae0:c539:b866 with SMTP id a640c23a62f3a-ae0c539bdadmr146489166b.41.1750843127551;
        Wed, 25 Jun 2025 02:18:47 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for PMXR2230 PMIC
Date: Wed, 25 Jun 2025 11:18:36 +0200
Message-Id: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOy+W2gC/x3MQQqAIBBA0avErBNsQpOuEi3MppqFFgohiHdPW
 r7F/wUSRaYEc1cg0suJ79Aw9B24y4aTBO/NgBKV1ChF8pMelXh8joijFERKWaOtcbhBq55IB+f
 /uKy1fnoYKWhhAAAA
X-Change-ID: 20250620-sm7635-pmxr2230-ee55a86a8c2b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=766;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bKa5pgN2i6WIOfNTB+lQHR7lOH2QI72NCfvc981xeY0=;
 b=1UGpG1Wu5aMcFmb5bkxLYnd4bTEBVtWgll8OHBt4p//M0fVtrRD3Xak5VngDQ8WcNiI+B8Dwf
 +P4rnE9K3uMDiGKHa1GAAZddeDc/gL8/JV0P+R9g1qbMvj4xoUFLrgl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
and the devicetree description for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
      dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
      arm64: dts: qcom: Add PMXR2230 PMIC

 .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
 3 files changed, 65 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208B3451D9
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804925; cv=none; b=F+hVRVhbYTPodMEbFL0OeEA5xEb8EA60Nr7OiX5eOrxzWMUYYp+BTZSe2wCeJUc7Fc2RxSB1nVXs2KPXoULRc8z3sggiZxP3hZ4HNWbYycc3kd43/RiVR4m9ZR8xQ3pIcDjiQazbC8TiCne9uEE+oQx9KOm1iLVDAXMAqo881mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804925; c=relaxed/simple;
	bh=1OR1ALE2jVrBKZLHJvIYGf/LHohuVdSZ9p68Cqwcalw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P4ICO7T2aeY+AytydyZTkdytsydagyOepxMPZmcy2S/NFh5a+NGBYCdGsyy2TrmcTYkmtE0cszCP3TBiEa/lTjMfVKrIs/W/hUhdRYmDKZCDvKUcni3eGE4sQwFUjIrFS7YJF05Q8Wzm7LgTKj6t1tAvgtduF1yEMhhdyNhGQMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ShfDxM3L; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ShfDxM3L"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso5415142f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804922; x=1773409722; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLo34mncvv+zEzucrHcRYMCBDiBVpv66f0nGWBz0AyE=;
        b=ShfDxM3L6Uhsa2K1Z5j/k3byQNeL0hM56ebI+QyIV0I8PPsfQRHYe0k5FLdUx7a+mJ
         2+tNYL3YpJjiFqMl/BkVrJ/JWRAlDfQDECdaIpKeY+YB5ICtG0z5jEUAD854AVohxOZk
         YmGYhkkEMLUJ92n+WrvpCs7KJ0af+UJD4vT5ih9oqzNp2VzSC+llVfowlXiravS0Eopt
         Xtab7hclGZgVy3ECu1siNVapNkchhV/WtaIilhLOOsERIn2Jltwz2nk38KB89dGawRPp
         iUs2WCYi7RyBoDxwsoHIhEk7FalqvEAfX3xxLUQDqigV2d8j8fp0WZjY6XF7pqyeJ/Gp
         Ni+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804922; x=1773409722;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLo34mncvv+zEzucrHcRYMCBDiBVpv66f0nGWBz0AyE=;
        b=O4PZVxgTOSsK8TQ0YtEGRCp9oT1IYY4Nj6G16cCbuFXVUSvIbknA1Xu1rgTFVv5BbG
         Czlj3QtghzZ/wPQh6yyZ4ZDlZQGI59ux8kR1qhYrhs8Dyrctpa8v/ybmOe5ymX0ZWQwb
         v5GlY9I/lAraN7ZqbQxULou9rXtXL01/b/t/X1t+Oo9IQP2zu1N8MBny/hqRE4xwgIPx
         2zoMdpEeAjAWI51uK3fiNsW0D7xxFUNUau3VuFbHUzly9rRO5/iZlExJ8X2MPKaniY6G
         95ulLP6nNS59xhKHiI7sBbFZmEuspg/RDwwmFmSMGtlhIUFUJBERxQh1pMwAGj75bhBl
         k5bA==
X-Forwarded-Encrypted: i=1; AJvYcCWg5UBLRVhouU/U5e0boksLnfG85/TM0A5IXWzG/0ForgHAsWKNwLcTpvl/DdFAedbs5O0skCILrrSpJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNDJRdcpqK/EFwsUs14jKjpfs1gCh4as9TnGApL3mfucszQoP
	9/+dkW31LOhK+svdFw9tRT6T1Z3l78L2efBnsN/ThAYr5nmJpjoyn+YRwjF1JFd7+X0=
X-Gm-Gg: ATEYQzzYIqFyKj1IAOVzjK/jJKJorT4poxSv5uQOb8nimUPZ4aogd3QFt3aG+oE7eBv
	qLmD2LbWlKV3tZMPoEwT0oqnhiqgXsWX1PGX+UC8Z52UwZrqFTBAkAD5KE6iQOWs4N/0NbAYJPX
	RheXkWY0ke/pDncJYU0nmXYJWPMkyilEfV71GKrZ4xLoSGZdXk24KeQcTAdiQK9oQQQQhsI0UXJ
	sHQ/DT4Shu+Ypzh7nsu7Eg+soPF5MWN7OaSB8dpwz8flUIrK23H8V4sS0Xgc8q5aIvfpttAMCx3
	g6nrFXVFN3y/FEmNdJdfx3ptp8/OO4jWgJSzJYq7eQKTnCIMy7flgHH9dh+nocI+C9v3+fySjAT
	HWRVMYuw5BxHWp3L4YpqdgE0oeA57V5JyVkRNufVSVg+JaUCCzZnipDgyUBrCmNtNYOl9OtVhpf
	RPvBlqNQeJPtbCkJ9oXoAFtRcilDl5OzeRNxH7m7vmMrrdfvNfQS+zdflzwEfv0gRu7jEyCVf+J
	7ede9NRyxNA65Q=
X-Received: by 2002:a05:6000:24c7:b0:439:c5cf:fc73 with SMTP id ffacd0b85a97d-439da654252mr3515918f8f.12.1772804921601;
        Fri, 06 Mar 2026 05:48:41 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for GXCLK for Milos
Date: Fri, 06 Mar 2026 14:48:36 +0100
Message-Id: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MywrCMBCF4VcJs3YgTSWWvop0EdOxDuaiSSqB0
 nc3WJf/gfNtkCkxZRjFBok+nDmGFt1JgH2YsBDy3BqUVFr2UqNnFzMu1bqnLQ4HM/QXNWvTkYR
 2eiW6c/2B1+noRO+1ueUY4WYyoY3ecxlFoFrwb59h2vcvz9r/VZEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=865;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1OR1ALE2jVrBKZLHJvIYGf/LHohuVdSZ9p68Cqwcalw=;
 b=M06UPn7KuaTC5XklJRqDMhh1yVrVJuyv/h8Op30MNbMy2A5yL6hzG62hBRRaUOV/nHGGRzFA8
 4MgjInTjTzyBWNYS0614zxmx4T4DuzYPPMgQWwBjqw7pF6UMcIB648O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 755bfcf32666f86ca2a9a2ea2c9dc7eca4c330a1
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


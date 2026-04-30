Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570DE39D6E3
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533060; cv=none; b=uJk/CAriC8p6eZBv2cd6Deu709Bl9IIL/8LqIOqWgTH2IFNI6evTZAvJoqx8qmqtnc/7C68hxXpBO3mm0AMFCCo1PPrPvtk4vwjsvSPW7TvtHokXSebgz3To5YoxmIJYucWr48ZkgK5OAv/0YnTq+t36386P+nNIlQKF8m5YCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533060; c=relaxed/simple;
	bh=oZ3hYpOlyjlAu2278aiFXESG6oi7YvWn82sNwQdQAP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TX7Lihyv4ABBPoYFpy77T7pAKkr0ig8knxcrmh3D5O8Ozhfts4PLFYwurieXIihSiQRXysAama/choh+a/Hi8yS7gNvvFkhvNlTuG0aGVZf8LfH5cEa07cAm4+fAOPyXLaqKK5Fe5NK93saz2dLFdPM7hYRcQ/p3MLzPHYxpxGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VODbNhUh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VODbNhUh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso4063625e9.1
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533056; x=1778137856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPu3RWNcjFZI9rac4rwEI7c1s2vJiCf0eXVgZgLzeeA=;
        b=VODbNhUhZ3JRsSFXqxR7ajYR/J/ppN7xF7APpx5guY84on6LaYIh1pci9w5cQngOp6
         bxnIFW13x0Stikv9uS1WL6Vs9uv/VxA2slTW1AMSMAQ5mL/lnjtr2NaBAWrwFTzgjgWH
         iXrV8ucn2kll8/rqCFCJc9i42MqR6ZO04+5pi0VbI0qCRP0JhbfWFqPpQry00eDYwD2q
         MmeEIKI/gqwgsK1qHhVx9sI7nO23cBUdlfWRRQbmIhaTswQQzHau/TB5/Q6WfWPbJIt1
         4bElSMrQlQc+Zxwu0qz4Pn5XycXfPxI7TytISZYO3y/eyeuduFsu1cVRL8Ueth/iBEwD
         2u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533056; x=1778137856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPu3RWNcjFZI9rac4rwEI7c1s2vJiCf0eXVgZgLzeeA=;
        b=cev6ufKu7SOn5LQ8LCj8X6R+oO2eTzd7bMY/FVK0Yr90z5a5EYiKbfaElEuuvtRbR1
         1HeNhmnbbawsM+mjLYWpIobwN96pjTZsqhYtFPgVRACGkP4TQ5WvU9l0rvgnfUkvFpCc
         XxOno/iz95H/2W8QqJE3GvdUG4CxIxaI+mQ4JAytI5BCYbUpElYjvnMEBkbMKMnJnyQn
         ROp3sbY4USEuRU7PSur+ysHC01joZuMJb7uPbKXkQbZ/w7T3doszDDlkfj1w84XOtvfC
         ap7mg+zR0f/5EODfvEk24kzK8oU51n2Uxnm2VeL7xG3dN/AOowTgCcaa/Low/qVuotlN
         Fd3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8cL4jpCu3LWYyRlpXEGJp4rfONpcWUQpE2lgXI7GoO9N86EpsOwxXj4OcI+Txq5UUztO7gkElw/4xEdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6bqagSzD/sttzAtMX8q5XtJQ5wmTrAA5EIlgVGRUZ4Na4HAvp
	UYaEY7QQQlXdKb6jOdGlDurpagLGBnGLD/2Soxax0oQ43SiMML5sbvSXUVhlz4bVPjE=
X-Gm-Gg: AeBDievLwpgomqAKKJKkju7DYJNbiTtUh+3NelpvF7hsgqn7FSCvVoxYI58vC3idFAT
	7b+hGlwIlAbVsPjB+FAMYSR9FHLD0Ot4l2l2YxmskKid9B/Vfvn4JBr7wJqwQ+ZeAh8wHuaSpip
	THe74tqFjSSKC1WSJ3Q8tYp4InpBKYhRighlRtL51/8p/dnemCs9nsLDQqw8bd84wku2oV43Biu
	9jioM34n8exdg6xGiGAnlDjcMOaI9Lig9Vqk4/C+2DB3OJL+I78HDqIGnTkBEgf3FsufkO9rVgE
	OWXzdwA9i1GC0VLeeH7ZGSrPadmTu3eW5zIRfRxE9sG/3Gnu51Q7ZBY8TqKbTx23tp2/DWmaJCe
	G05xxtq6LekRxAF+h8MOIOJlhtt9dbTxmixOrznZWBVQbTyrXipN5vZYpamkLbhtah50XG/Icwr
	NWBjnamzWKHNQLP4K4lVlb6NrIakwJf+O8ao6T0kOO7BUBf2vSMsunjyGLTz8STJiWNkh1BGRK2
	GNOkz8T
X-Received: by 2002:a05:600c:350d:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a83e7055bmr29150115e9.9.1777533056652;
        Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:45 +0200
Subject: [PATCH v2 5/5] arm64: defconfig: Enable LPASS LPI pin controller
 for SM6350
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-5-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=846;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oZ3hYpOlyjlAu2278aiFXESG6oi7YvWn82sNwQdQAP0=;
 b=xad101UiCBqCR5XMnrmHZ5A0H2inv58PbwoxwJ1BifMHEpwZu2cxxBPrjyFkP/o232KkdMkh+
 gT2JdEqzJLVAiZh+7LpXoduaGVjaxXpacZlUQg0vxWrATb8YTEv2vJ6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Build the LPASS LPI pin controller driver for SM6350 as module, which is
required for audio functionality on boards such as the Fairphone 4.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..6b0be01af7a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -705,6 +705,7 @@ CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
+CONFIG_PINCTRL_SM6350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m

-- 
2.54.0


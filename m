Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190095;
	b=BpIAMOFbRMyQ2JIbAOTGmSkHfVjtqBURLclHCZpcEQURMXCJ3vw3tMttQmrQ5kBGR0Za
	 fLq4PmXZa5TGZ+wyFmHs60VTRQaKRmIkp6gpAhRihkjAENX05QXO+mxbvi/qDyfA0h+rb
	 WKiOsqoiGmu0IvmOWENTjAAff0UfbfIe3nJgjp62/f+kKdJRfZEAHrcy2Evv9U/nMgilK
	 4STmJx40EhVEv6XnheHADnRFo3l+VClAqzQaanJg/QDl26wM5FT5d51rl7WIkJ0okdKTM
	 mx6rGsA+Em4/zhTMJnEJVzZbdGMNSKaG2prBe/2MbaBZyBaTpRzXbf4wYJv9pZV1LhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=fRCAXzX/WAdhW3lqLxA3lMLs5NmYB3m8cPDsDwQdt5/i18dtKz76T9nSoQm2H6yf/ndA
	 d9i0ANUusFrkuRzZkhLrKOzllMsYMGxwZCoRJU+ZiZch2Y79YZbDPrTxOVGp6l3e246Zm
	 7kFcBCG/0lQUGqRHzkFdR1J1muFqFr/jvmaqDU1ZwkIoDa00uaKx4sHJyeGHkDoneQBRk
	 S/+c3un604OYF4jxLV8bIxoPVFNprROZZoyWTOvgoe4b0jutw6j4HWD9T2wRXiqJhSYCI
	 XNMf3qZ6wsTJRggbVPEgsN0Xzaq7Vs/RoQ79QQsFIK1Jmdtlk9CSfFgLgaACcVJi9Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB25606A33A
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB25606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so6582815e9.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190093; x=1795794893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=C9ymzV1nmJJShkya7UcSKR6iPDN+n6RuxSd56u4zS4owB/0cvJp3RDW67ws+Gmp9Oy
         JxkSDl1mw5dfJV7cYJf1CnuPNq33/dywYRPcs51Z/1PqES9VB53htY2kCtrGZZHijOLx
         teyhPFNnnKYqEPMEQZo5lIg+/YPMVhfYBIqmI3bq4n9ha6d4mIcSse0j+8r3/ZHFpyFr
         WeiAvffXOcPc1haHpB4IMFkmCXmC9Y4WOziIjRLOEMZil0DiqeOpJQF98Br5cMKFdLjB
         bP67IuLd2gKNBPlgGiD1S+FbgLuFU+Bup66zVZR6ib61yBQMSNyG+iFQHkMB8KJy6+j4
         eDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190093; x=1795794893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=2C/tvdDhuYid9JicVJ0v+9J754XUmSWtxVRCXfS/6sOAmdvFd3r9n/A3hRpcKLMa4q
         FDSmSPhl9gCbxCZDPJUuZTN2WZHInNnAHGIQfpAPLVeVz4VLLvViucNePNNxEy/Kw98t
         fvcAmelB+dLZ7yeYADJcC2jixKyPir5eu63i9Yd4JJpMsoDE1nSiohQqC12M0Ij0nX69
         cTCdw2uMHbLBLQOjkUiw1zlwx1iM4SlYrrlGCdret86sGxvlh9fLRSSMkmIQOXK4VtAR
         OP60pyj/qf+WJiGaSf7t+/7OZdEP6uIYMwAjmy80qduXshhXqa+e5Irs2SIjd6mVo56A
         SkcA==
X-Forwarded-Encrypted: i=1; AL+hErEpHrluzlQj8/MCvDPombEqnnq1bAyt3u/QICcq7q7efbisjnLdvji3VdgTCwMg9ByDXxIwhnusFsYKbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MmBIMwS/TscEGdxrKKqesOxYDXIrH1qcS690WLHvljVnfAuTC
	1Ws1xyuumzQPXw5pDoJLik+46vTmdGgHt9SI+BycxlfnHaC7Bb/5msKl
X-Gm-Gg: AYBFou2dyoVNvzeLr1gOaL76dReSs9yIlgjHW64T0eQDT2NtfAtqrrGuuifbKfuG7xI
	PAgoOgXfg4rSZu6SToXv4Zkpz3GJ2IWpU1oWxU/VtfTkXZdxQR6EAi8QN4yCut2pue+nEckRi1f
	v01t/IqEcsCcfK6Z7GI/8MSAvDFCiCuKeFxWYDhaXJdxeH+0oCVo66All8ZpNZAR6iiy4frLL+a
	D/bUG5UQF2vsHrWspKUTjxj6hOcNb+8vtZQ/hP6+IcUuBqLMba2wpPrk/5vnKO668Afg/Xf9b0G
	TqbQ9dSCZ3akYilyb4uLaljU6jLBhDvRb/CYAgoQtWXojUUqe7IDTd1zzYepUNZKvQ21XcWpO7j
	08CHAYMOfzk5QS9oOADMg2Y9U/GJnzCqHsViPjCh+4fz0fT3FfreVi+7qghwAVYvFs6FmIsu+No
	oW1FSeSkf4VxtuRJmDJzSbJJcV75/ZwFTztBYclHr6vgSpNPrAnulFQxKovA7/JHrM2+nM0uM/k
	i2nWctol7x8ouiYRGqSQR7h/IYahT0Ujc2L5R1vWONSMpK9GBbdRw4mF+NDAWgRcZU2+PpENMhH
	Exm058yYodt/EfxZMdlqC8n9x0Qk3DizQ5gOayMRud/ocu4aido6RWvRu0AZrF4qaU80dFk6X1o
	=
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr76390745e9.16.1795190093061;
        Fri, 20 Nov 2026 07:54:53 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:52 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 16:54:40 +0100
Message-Id: <20261120155450.7719-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5


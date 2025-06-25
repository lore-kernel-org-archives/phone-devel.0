Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776F28541C
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842817; cv=none; b=eOZyfBais3EbaSOZshPNiQQGr9EgVG+3BEGJrXR/uzgm+5MsSSBwdcpnBdl1fo5oIcUjVw4xKHGBRW4kXfvAQXf3L9BVG1BSuc4NtCEwiBkvNF6xDwze859AneOc6nhzWYKa7tXkkUdNOtjSA9TIzjIGZOSUikNjwmk7sU2IP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842817; c=relaxed/simple;
	bh=r0M6S+8sborTozQR+msrdhkLnPY94JjF8rfiMkhWlk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBOX9Q6R2b3oW5/ZmzskNdgX6ruxozoHAIXP78cZqxXVhVGoRtgI3AlCLsbpLIgFT8BuGIvYixpP9Z2b8wat9lxE5ZmUNndveYrjwdt7f5H89KgwaKSJfX4Q3GZXbL+PR1pDNvRyx1aMbH1KVKS2seLze+UfBWClzgj9KaYR3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2f20f7lh; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2f20f7lh"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11872482a12.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842814; x=1751447614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17G3N7jRvQMr98ZDvseO6MuQGAn4fzRuTBF5coR9VHU=;
        b=2f20f7lhssQVmnbq+2YohGa3lU5ehMPDrVI3yhArGEllQDcnhB8kV2A6Pi8GHRq+oM
         kRw5Q04Ad0Y6behcVuuzVUcIPSNH6+TaTH75vqN5a1pV7N1utuhahFCi3x6RhZRil1Et
         4cHgdIdh1XFQoXoHkD7Q9GdeqVUjhxwT4yXP0di3KdS9NnISgqjOaDWuMG5dItEeinc1
         mcW5A8w5dUn/zigC/UESt0oox1BuXJs4r+hUoQn4wQG0ukkS8AWD1UV+VFoI6cEmm0M2
         1y9pCQySVONevuEkc/X/Djs0awVrrEyZFQS/o9REFGPSY+IBSZVXTsU3iv5jhFPtNTYT
         ifrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842814; x=1751447614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17G3N7jRvQMr98ZDvseO6MuQGAn4fzRuTBF5coR9VHU=;
        b=WDMsc+MzR5Ti4X/iG3Oq++fe5MN30aijLZQa86c2vZm/uTIZDMYkMJug6qo416byF6
         cHyu2JvEjfAxK2luTF9T3lrSB1f+JM3yykbx3/26D1lbRUGfh3KBW0s3p5txAKZTfGc6
         SKzDD40o3jaDzU5Y62BPgJeewXKi/LnraCNAvir5cNgdJLJMULjtf0kKsCsOQf38jY63
         84G2RRVLyLk8Wanb1p13XCrg36g7x4uijLQlhUp0lCAy2G0lq5YkyRv0UTQ3nU3mvFbw
         XE5SkcOtVpNQn14zinGtS1TZ914E4CcBBkC3nL+NVuu5t3lgFyG9gWoMrTYl8XVpEzkM
         uYtA==
X-Forwarded-Encrypted: i=1; AJvYcCXGtt5lS+o/xCxyOlmnLOeshXYqxxM+gnfh4eWhd+UTDt5poKvzcg5egnYprlPLkZTL+rK1gcSgUbKtWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9MalUgMaf8RXJR78TBnMCeNX6e/jK5kVnCVD2lO5Pbax+T+B
	PucdShf472dhnxl6Us5lWt+ieZInABFDVrbLSK87ONcysIkZnkeX/4Yq+2Y+6UiV9Z4=
X-Gm-Gg: ASbGncuV9hy/dullt8dX11srrw/FisUbd+Ja/Fc6InmYmGLi070TQgwIinMlo/JR4jT
	6MAuUFEQuLgLTo1zJI0Sar/Q2W51E3O0XlmOdBIOqWRgvStvBGO/atkURzx8M0HY3yNtu1ddDIS
	mAObhXk07b7QyTOj3u2iZ67mnkgUjeeSTCQZ7yB95AGw6eSiF8fVx7jhTUTTjnpE4ik8fmJFMAo
	aspIjM2NHB1IeRIgtop+d3ov8W10RjgDmi94HhlgtfVF74k3syT5rutsZym2tByhhnRXqPT9Shl
	rt8U0+H/hBd2qmq2n0coZriuwNHazi9l3XQE2Y2NHsf4W1PvIcfQlWoNp93e8qsvHeVaH4JtgMM
	Zi+zjCfmyWA5ARQXvq3MpSxRsg3fPh1yG
X-Google-Smtp-Source: AGHT+IHtN8rF9jT36FGFeY24lEgEDKLCBuJ72j4a8PMP55mZ2eMQzN36PcTHorCZJo8JzcTmKrJ8fQ==
X-Received: by 2002:a17:906:1343:b0:ade:8720:70a0 with SMTP id a640c23a62f3a-ae0bed1b20fmr173874866b.20.1750842814425;
        Wed, 25 Jun 2025 02:13:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm1002786366b.128.2025.06.25.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:13:23 +0200
Subject: [PATCH 1/2] dt-bindings: power: qcom,rpmpd: document the SM7635
 RPMh Power Domains
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-rpmhpd-v1-1-92d3cb32dd7e@fairphone.com>
References: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
In-Reply-To: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842812; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=r0M6S+8sborTozQR+msrdhkLnPY94JjF8rfiMkhWlk0=;
 b=JV85IXCu5LtlvDSqrWSOtV6SHyeq8t6FfsfSBOEDVLp/36Lns7YV3pcMTaXDgEdRKDDTH/syf
 ao5dIEG2k1ODU0PvHFJhUxGtE4GJnPg8SEVxPypJ6v8SaE2FwXCYhPN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the RPMh Power Domains on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 1bf65f2a583ab70ac313309f917aaabb75dc3f85..5a698392c657330d7d188c33c0bda46be5aae690 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -56,6 +56,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7635-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd

-- 
2.50.0


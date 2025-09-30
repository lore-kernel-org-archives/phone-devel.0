Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCCF2F9D9E
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240642; cv=none; b=kiabu5LMo32PmGpsEgtyq3tk4rLyjtZlQD3HOKLkMKbPu0/WyqcD26qe1mBY5AlKrSTiKOZnB0urqPIl212MMP8ZN5nrAAL4J4pkqSzJUA+uEenHks50V3IJBaJzAEarTTXNkE6ra89fqvbF43zECku+kdh+6aE8fUTkIL3NJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240642; c=relaxed/simple;
	bh=9MhBfHLtfKllOPgLD5n4VkYHmbM5vctQ+vVeX9gfLdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnhytVp7VNzuFUS4BXPErcg07XHaMz6GJlsg48Wwy8H+HWCZH5tsrUtF2NcQd2ymITEmZQpLtjFPn/uXZ+jvDUSB9T9rTguM1rt81fi2MZAaiRlEqZ/trpFvJs10PTCNeh2Wpi37cOOnr1p6vEV9tXymn/JZ3s75HISj0ckMG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B+nxDsb2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B+nxDsb2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b07d4d24d09so1146824966b.2
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240639; x=1759845439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJqD04tCih34r7vGvIKjxsGrK+J1JCBmttdD15ym8gk=;
        b=B+nxDsb25EJD+b85y6OX3PZjBHiYUxnodFIUlZH9Umsw4hOxmAU/8UGi7M4Nb1R2X1
         adVuLd50oNm2tyaIUEYFKBUWiqej7dh6ppJe3odCLQNQ7GqdVh0wCqPX6m2r2Hr2d3zj
         cyP17v1xMpav+tpNe3eTwJTGqPBXGTCqx8kv9ZhAfjlZJ6yh9RloIwqRGJzHAJmL+xgg
         a8xmxz3fphK0HlcasTVycYP5kzxSe66PCucJJMmXVLvG3Jp6g8NvWZIN37TPLBXuYPnN
         fcIesLPVX6oxzHbiSZsh/kZH/eriQaJ1xyKU3whIjU+QChuaTN8oRNcZkkkN+pYlwxHK
         v1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240639; x=1759845439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJqD04tCih34r7vGvIKjxsGrK+J1JCBmttdD15ym8gk=;
        b=lXaEHK+Ixb4o4B6yUki4y6DZTuJMrQi6KfsbYipXCNr6H3RbnJp1aasUVKQTRIv0J9
         JVRX1PKbxfvamqFtRgv1zsqfoFfoZaYV0+HGHHI4SrHP88kr9D5pF1wW/qm8lqBfbBV2
         TOtbt65jwHF42iFeKsxeSCseSdDdFFc+TvrwbIWqkkj5587OOLm/rRcjrjLjaBMIy3kS
         Y/9kjvHtvP71ahSUIzhWYkUMWgbdyr3IUL5IgqTY1j8kohKI0/vsI4bB8aDvxsD9qdzR
         TFi7kCRrfjwFQdBXOAndQ+t1Rnv+8SF9jcdNC+NGRNDhVXj0H9bq4DeF+13TwSuaIxWd
         BU1g==
X-Forwarded-Encrypted: i=1; AJvYcCUsuvQR0slJSLUwPfYcA1W2iPtVqVPEkLtq98m1vaIpGecmlZ5HZtZumxSeC49JDybOldHl+USJBe4wlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbiROIVqd+Gk5hqGFqrjaOsTCYb3YcdDGzAuZKbYcVVKd1HVl
	I/N1ReDBVLYvM4u6U7WJ9tKPwFaaGuQ9hIMVUOnojgs147K3YdAxMJPXBlBcZj/bg/4=
X-Gm-Gg: ASbGnctsfr5NGr80GYlH52p95R8cMFNXltmhf5m7agx1BglppqzehE0Zd7QKvWcvhew
	4vd9d8k1wC0do6VntBuGmBl18zDWhz28ZxO+MnGVr+MiYYGuC+/n3/6zELGRoibjPwEauroVCvn
	UNo2eHMc/u18cuYY4I8HBsoYDDqk5qXhGtJ57i3gi1EWOADM+O25zyX4NtVOCFPdAHEchDwOPaO
	GUWYARooVOvjJNMO3QnRw2UcAXbP8TJXtLgzz0lR2YLR7WqiPHZysRet68/XAIlHLnkB9SMaf8s
	c/cQs99MbdKYibvoRrPpQVTa8OzzCrTgWVc1yF6iY0Jo5wiGZbutKqVweowPht74JdUFdikg5jv
	fwO1WM1qJ2ibB4GhDhKtbCt6gmX6TIDTeL4rgv9JI/Cp7IZXlTfLixP1sNrlUxqJ5HqxSveEUaQ
	TDxJjml97imohfIyCPN6zi0YKxkM2A
X-Google-Smtp-Source: AGHT+IGZ33shaFUW5jyb062Uoeoxlt0WtvK77vrIa8wlglgVkKZrev+KcyCBMMVsBEftxPy7dxLLbQ==
X-Received: by 2002:a17:907:94c5:b0:b46:31be:e8fd with SMTP id a640c23a62f3a-b4631ce4902mr113558266b.26.1759240638658;
        Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:03 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct
 compatible for audiocc
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-3-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=845;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9MhBfHLtfKllOPgLD5n4VkYHmbM5vctQ+vVeX9gfLdU=;
 b=/Z2PW2Qk4YNfWk37c9jUtWn7t8/TMDeCCdp+pdPILEDGok8S0HaBRFxItaEvxxqJeom7gDjcf
 4Swql1aXtFcATWqFM4g31FmZ0ANAjH/jVGWwHR5Wkw5SFMTnBpiF7QK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Use the correct compatible for this phone with standard Qualcomm
firmware and remove references to power-domains from a 'reserved' node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 0a64e5721e092d1f3e4bb7329335704eee567761..aff2959c0131de90c42783b7c45f6e8e2ae18afe 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -854,6 +854,11 @@ &ipa {
 	status = "okay";
 };
 
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.51.0


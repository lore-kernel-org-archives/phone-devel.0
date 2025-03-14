Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D997D1CB31D
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943837; cv=none; b=BKFu3BUtiY5S/Zx8DJT8n0TcZkGFwT6GnaXwPTei3wIpTSV3qR+Q13qE/qnvCn5ZMYX6uhZ205BmKj1Y+0dQwpEcWJEYpZSmkPQEj+mwaSqydsXE9RW24X/+lcucJRoqXIFHUPkDfD0ZjkPz2O2qmzEEH+mLvr22vRoL8OGtNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943837; c=relaxed/simple;
	bh=KUctck5B55TBuotnv0g4TVm9b/ov5ZebjgiW7exjsQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxLmJ4PJi8n3O9GPpLSZ7w4EFnQY0jBQcpO6QfvjlUnrzBO6ZK7dcy0Kjn7j54K6mqwIMDyNCC//J+BhQkKnSardIe7vCgzPWxCJkUHfWSk5xPseZJ+kLwS9U+yunWuLBX2KfAovacL/xyqtWaPzR4Vc8mm8hEmYKSJO8DTg5WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sn7xSLH5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sn7xSLH5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac25d2b2354so328382166b.1
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943834; x=1742548634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DduIjgVbqMB+YIwUT9DVdolqDatgrNDkgwKYlFwXCYM=;
        b=sn7xSLH53u/FyO8GYZzU+bXDy6EiauK2H6aQb+V9p7JBxxG4EAA6wooCde0WxQDXaa
         xp1xbHGuAU1x5bTLqESpzj8taA8S7/9VxO+TbGR/tjiv9axNa4IqUmizoyR9smr2SFlC
         k2Q3ESEFgCMgdaeCgzbpVUeOZNqJBXQMyU564+bPoW60/rEyDzicwhcyfW7VKy2spYe/
         V6IJ9l3p/+JBPOLBXM+uhXK0CDjeUQDXQL8W4JkFiW9Wz4+xnlDlLk1DZYnqD2r4QfaS
         8xtV74OHr1xbF1YESBdmDECAzxjorEpjUMCRtmnskNjDMMxO3wMszLJ50okCSYCeTBci
         HiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943834; x=1742548634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DduIjgVbqMB+YIwUT9DVdolqDatgrNDkgwKYlFwXCYM=;
        b=GKggqxlVKrJ0cOr86Nd1kzUB3jRms22hjnV71cmR1DbdMkxOdvb2z6ovW9twTRQ6Pf
         zJOtOPJvwA03EVJMEHZRnIT02Qzt6EHfAZUQSHLDhQIGKjQ8uM309k9PNq/ImvZq4b9w
         vCEhsivZImw5VN/bB/h+2L4RkVauGqQt1swf3iDSY2GqbrV39CNwWhql8c4lnii/XOqJ
         DDjpuopFPWeVUKqrkhVRsa4Eql1d+h+S3gxQ/oyawaNmwMe6EZmlvGRw/7eJMEmelrwr
         Eg2WNIVcI3n5jLwcRtk+HK8dEzVhNg/pZ9YS2pca+YXdgnfOLB5Z3n4ukBhzu+TLYX8M
         lnSg==
X-Forwarded-Encrypted: i=1; AJvYcCXl14Gk5yVYwVa6cJD+S/pBPyPmSo8GdkJgxBzjQeBu2cvA/IDSlRsop9p1eMpDwTToYA8R8tJyvbW8vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycja+AcdhOEm/5va1R/suVEjIon0Xr2MIIOZYE4CnSLPWTyJKl
	W4D1i7e1xe7th1A5RkLdVDa1SCxKcc9fM7cuj6Vhv24S0gA6d6WeHNCg41cSQM4nKaEaMdvugDA
	Y
X-Gm-Gg: ASbGncveLnG2qF8WsF7WhZcp4ivG013ZEP9JOOGkCIJcXKy5WS0UtXGJH7hQGF6670A
	A7o0GMS6p+A2ZeSzaq0/FkbwOobieH6eVRdh9jZJXDC8MZEvO36ZJM/0Ob6NuzL0HWMm/CckIxG
	oDVB8amAkPZpGOW7wx1sTghuUVhDLROCX7mdSjsQkJjYowWCkM6cizhEwR/qHpYSVBNMuxTaByQ
	uvWsR5orV3IIN+GgICairdIJmF46SNrLOWJgAJIfl9g/cLdyzWAQCUDYpxZvMp/jZ8ypw0KmhMK
	t/n9Sa+4Xrf06haPG7s4MWd/qrhkkeLO1FBIELdm3qvMkovaoNt49ThOLL0qTem1CRGnwOJua3X
	zKkl6IitDfm6E0FcLwWLuq6aNDrUw
X-Google-Smtp-Source: AGHT+IF2fMs8v6rvbwb4avWb30H2q3Lx24BGBU4BTH0RNBEh5rOJldaU2Obk6124KsZ+HU4ZWVHV7w==
X-Received: by 2002:a17:907:7241:b0:ac2:4d65:bd72 with SMTP id a640c23a62f3a-ac330441d57mr197243166b.36.1741943833904;
        Fri, 14 Mar 2025 02:17:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 10:17:02 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

During upstreaming the order of clocks was adjusted to match the
upstream sort order, but mistakently freq-table-hz wasn't re-ordered
with the new order.

Fix that by moving the entry for the ICE clk to the last place.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..e6df0b7dae8baf39bfa7ff3856759e8cd200f0c8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1177,11 +1177,11 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<37500000 150000000>,
-				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<75000000 300000000>;
 
 			status = "disabled";
 		};

-- 
2.48.1


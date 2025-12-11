Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FDC2D1905
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422326; cv=none; b=HpFwdzbVfj++p9LnTiNtF5kbMmS0aTC4iaO7oQ5qvLMmnaKl9C7BYfUSWFftAtOjWzkbN3M5nZYfz+luyNqxgJ2bZLxwF8xC5utSEkRafPt58Y7emz0q3gzPPCbFHBi/rWyagYgmDq3hO2+M+9ESGPlv8TZkq2Nwrv2ycFpFhSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422326; c=relaxed/simple;
	bh=PQu0wItBZrUuS/K1W/yh+H8uckkQdIBZbL7HMrihDHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRHiHxQN0NX+gpuNStZ7pnU/g85KBjmrVNNhhfZPN1vG7xqYfwoSrDTn/bZzIbI6rl9j7ES6kURMEaq9jHfCJBqzkbAee1czc8fGNNA7WNNQ1zi+ox2gChVPp1NuFhmBHiBxGvgdRKkhNBlFmuYhIuiTFwYzjfhrfzFiitfA+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Idw7JlUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=La+uIFgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Idw7JlUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="La+uIFgR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB32mGK3683145
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=; b=Idw7JlUuP8fkn2ie
	13uPcPuB067Io/Jp00DoPsvG9yNZNeNJRnDcGYSNrXvC9rpPVaB0A0d2sO17BrJk
	l9JYgHSFk8ioCd/ZhUN77KEad3hg9JRlG9GvYKHWYa3cpt+4/J9gFQVUl4j+sLko
	aAfad0GwKVHZuYwNaTAiyiZil6spMo8grvBP6xlY2pPaJDbHcwR72tLLpXni2TEi
	kNy4xsDwsp2b/PjGZSKa0H0YVMJE5QuoXV3GeTygE/JTpvAApn9WnwKSIZbJDkHo
	1IYiXNz9RGGtwu53JWLsLCLkLUFGoR76imRLDENM+UtB/UpvnAWN20t98nWvOFEm
	Z3rYpg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvr076-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11bd7a827fdso2270778c88.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 19:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765422320; x=1766027120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=;
        b=La+uIFgRbs4x455Li8XioTyHUcfLVhrVIrECF268pIPKTcbeLDgiGPwfj79KVKuG3L
         k5hIRVEvN3Bfh6CHrYKigIzKAp+zddVIgt/WruYEd8xEKuOre8v19cZxTYOn6XkyNDDJ
         ae/ay/cc4jjEL4H+EcmxxCUghezxKgjFSpK5lTvbXyAbFt/YyLAcsmOb1D7ICy13yZaY
         U01iBysFUdA79+tJ+y6R/8OqNM2PMTarSKOOMo5cP82vgfI9/EJDQo6+ji0bENK2mwsl
         Do7Sk8J49/oFVShqnUzFwCYcYzV2c39hJxGRL47AwuUCP0VLLwtOAnx/JPULfm59ySIf
         zHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422320; x=1766027120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=;
        b=vajobdrUF5aFYl69CmGBtcybJL3uzmFMUjWlFtM2ux9YpI/lzSTYeCj0jXh8cssK3w
         S0XlnfjXZpjdcmBcc3l7BWZMO8Z361pK5XnsIK7ofdLjbax/VjrJ02g/GH03FA9nOado
         uWVSdnnZZPa3ghXinKX657xMC4Nx3udVcrDLjIbWEPtXzE7o64kj9/pUS8AB/Z10imdm
         nBPcx2+1TrgfkrqMIVXW4MOSJRJsPAFn8V6dXkl3BjjE+J05J+axCeyPr34epgA/uVJS
         YjifKmgCQ9GP7Jyo+p+NnQpf7I8BFdF6edvA6ZEi/yDh4fsnNvmQ6hMB5Tq1v4lSElT+
         /bFw==
X-Forwarded-Encrypted: i=1; AJvYcCU2yMLk8E0MY+g1+JncPE9irCdd1lMvvQvjuLq5LeJ37PsPbRcfKKEExWemBq8dXa10yXwm9pa09bkMlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+LnD0PQJmSlWZHPNWVX1zO5+EwuFU6PjPonY3pfVOcyZBqFpC
	A3eXl8FYvM/JG1kWPq/3JYiIIb6jvQErLlh0CO/+CP+j1ylTmEP6NKAzWh0pSm3JVyrqh35T0tQ
	/sNve8rJTrPW6Ln0ZqWDQJw5SCKI9soySWDCWndJ6V9VnkLtTSEPuAL4KDKQ1/mT0dg==
X-Gm-Gg: ASbGncvZrEsD1F/kMsyOpig13vyFCWLplsMYvvgR/qOcI3iNo1eKThbDTvavjcFxRjf
	hKirSM2HU/nBSMSEqeI413RepNvFZt55MfIGB2XegUdsKTcnEtAcEZrew7IxLFNCdBJtfNAWt3z
	fFhuFBhJFEo/rDaG7uJI2caaDLgCL5rS5b/Kc7khkemhM2jTOCfTlLR+ysfsFvxhrCPkt1GyfgJ
	BBoAJWSbYJms3sN6P0GRvZ76P6Wx2dYHRYMki5qyisBXJx0sxl6XzuCfJG3lIxURsTWilOuQt9E
	59wpDHK7RBeq4GuKirhGCdFrN3uzQDbM+ZCqqv7ypDinMaHOATlestlcoNwq+Tr9dTiI6HUedM6
	VkkjYy1OY70eqiR9il1woQZhXjGAF8VPKtQjJ1JgCwKHf2zJnIlwE6X6REp5A
X-Received: by 2002:a05:7022:f209:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-11f2ee8f558mr499374c88.20.1765422320416;
        Wed, 10 Dec 2025 19:05:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7f/WW2p254Uw16xj+iDA9TyijC3WTJcFCKser1BK+diS+jprU02k//IvFf6q7BW5BquB1lw==
X-Received: by 2002:a05:7022:f209:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-11f2ee8f558mr499346c88.20.1765422319873;
        Wed, 10 Dec 2025 19:05:19 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm3935642c88.12.2025.12.10.19.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 19:05:19 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 19:05:02 -0800
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp-dts-v3-1-8dcd52f055c2@oss.qualcomm.com>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
In-Reply-To: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765422317; l=973;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=PQu0wItBZrUuS/K1W/yh+H8uckkQdIBZbL7HMrihDHY=;
 b=nyirDO7iW+lTDwFTpZV9+9kQkABAQJB5ZHTUCdTbfcpTQAjiTgo0pYjRWmMrzh8MyKViT3c43
 /JBATjehUioBcuOlsAOSvX0aSofmXaUSNke+7nHEQJx7/4xvpNQBAop
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxNiBTYWx0ZWRfXxiIUT+w4a/uE
 cz6r7IK7+iF2/HK7SGtw7VJvsOKTQ6aqBrehxoqwh7LuSS0lpv650quVz88oTSZmh4mdckPPXsX
 hqymfZLANIwGlkBMaX74CqCTAzHY06QfSpbR46H1zH4tGWhIu+7cvf9KXVyh8U/nhb+a7cW2CxC
 C8a/jYlyOe0lJWwNq/hDkxHGKDoDq+unv7wo4S1GYytZfR53ehAndugle8VBUNYfREkdEYXrpcX
 MOfN3i6TQxivTPUsqPPMYmpWJHYPYm6bhWTQKGTjKUjGPeBnCZR77dqjVe9E3TO1jdCHN3eRmj1
 /DSJfjM4TkgNeEXP1QUHyHgsgDPHBlTzSNdLda58HuDKvXGMCqrkDTrwXjClXLhP71rGCx1N5cy
 XuxNFCUWs/sv2d7Lx3Rf3U4QYYbTmQ==
X-Proofpoint-GUID: 3KX1F9WGkmexnp__Wp4G5IJWthQ3caUF
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a34f4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8VIqy9Yext5eKz7IjugA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 3KX1F9WGkmexnp__Wp4G5IJWthQ3caUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110016

Document the Kaanapali SoC binding and the boards which use it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..da287cc9119b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -327,6 +327,12 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,kaanapali-mtp
+              - qcom,kaanapali-qrd
+          - const: qcom,kaanapali
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.25.1


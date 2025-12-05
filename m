Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E62D97AB
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916314; cv=none; b=pagDif2HoZtWvffSAR1m07x4ChF2FYQAdgJBwqH2PxjjkXla08qQwPKKBYLFrO04WBy36RIM1oBZgW1dYzdQwlGPGIJ9XIcs/QbiRPb3PS11RS82H88p+GBmRhA+XDau9CQu4bBazKZHblIgAe6KCsyKUAjEeZ7w7rj/L99mqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916314; c=relaxed/simple;
	bh=UraQRW0HxMz552nMZZUEOzDqeHa7MsNxPseKkAxEQ1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEcO/ds6fExTV2+5r+Dj+zPGfUsYTxaI0CAYP2VWailkazMXSUdoE6w6HfVf4kIb/Nbjw7QKjRL8jnhoJuiX/bGpobWZZkzdP+uey9eDZ0kvO/fmkCp44rSbE7gCHAln4sAX7X/KB/vPMdIuKkFHj4KMgVRDbTbwooWUkcaQlrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECUyuHV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgHpz9IS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECUyuHV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgHpz9IS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4N2cwa2896551
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 06:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v5IfNS+DNYTu2kOs5OLgHjhbpAMzsb8tTPKNH84lgX0=; b=ECUyuHV5VdPy3ey6
	FnXiiuuVY0ufFjH6tHVDxgD1M9Q6zxyZN5QeJIyoC+rA1ivNwXEduelkaSOT0zT1
	XfCb1MDSDVbjxnWS+ipRlPPOQ62Fd7dOaDkuD+ZK/REBZpCMNmELXbDKLSu4cygQ
	oxeezjO+wU7dLrKy0sbLbNC1I4iKm756qdgTQqfGSmnEVeS2JAFbZhBDY0DqIMqN
	RgvXMMkZe8ClLB6/Re2I944dF6AUrO+ovZOnrAiFGsIGO4u416LHxBYSFd7b1K1R
	JaGdiitnTMMHroMv7ZTwAkRCKfzONiacSpZFrAFYNAG0DeDmAXlEMbgoezehTspX
	qLcIqw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj0xyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 06:31:50 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c76977192eso3808198a34.3
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 22:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764916310; x=1765521110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5IfNS+DNYTu2kOs5OLgHjhbpAMzsb8tTPKNH84lgX0=;
        b=hgHpz9ISZPwQ4x7pD2R4BcHY0jwnPfWJ4+aZSdhQnNRnCDErAi891+wfU+an+j1xkv
         VxzYXEWoHzScn2jOp4lhdaa2Vkv7yBXvbgeuy1MpDOSwoia62G7BUcDeUzwvv3YwJI3H
         wEqn/IXISe2YhQ3CN7uIa+1CrlmuBYMAa/OvSZ+yXwwx6uZxHYl3m/99HKW67GOKuPrH
         gFj8Mp5nFOl2/NTN70ChPGYgA13mvn8r6QoYqj8pB3nB/8xLQq99oHQzBj2hukwohoGE
         d+gOmO/PqqxITEpBgxasWgCZ+YLRxQNW8eK0DbtAQjTL/tIFOPmMN8B1WzSlXUB5NLHn
         /5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916310; x=1765521110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5IfNS+DNYTu2kOs5OLgHjhbpAMzsb8tTPKNH84lgX0=;
        b=B/U2thaVDotYEgpXAaT47nv0rcTnvvgalu4rNlsP9B9j95PhGEIDIjhF6nDq7/KWyf
         cgr6ba7te3iH02BXAO3HSoSRx7+1l1EtFss4kk5rU+e57hVshIvg4VJAK1GvQmeu+4Hj
         0chtP+bg2n7JVzFSQNW+Rs/6pgYS28RL/x71JPqRROCug7tg4iUNKMDvaH4Odiy41Irj
         YzigiP6AHQwU2OH/G5ydZxvq/I5T3n6FXWe2lZPQaCWcXY4Z+ZPXt//X+Dc056m65kuF
         sGKNcgWHrwCUOIq/tb/cEhniIe4C5bwChbWxciiR53sqIwkgxD9NBjhS3VN5+40PVNbK
         cf8g==
X-Forwarded-Encrypted: i=1; AJvYcCWZdgkgn8X0R4Z5bX332PWbR4sH2nN9bFaz/wsMiI2okVj8+mYV2vGjsAQmUue+O0EC/jz6dfhU/JfjgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxakwy8olREPMy2RTlBwN2JvKA+sSfEv0vBPnbMbSUe7OStjTA
	3x6F+JVKdB5kaS8+BhkCwzP3H4u9gTg+e4MCMVigrS3olj+FOJjmFMWlF5oHd1OE5A6iNdPYmi1
	F9NrX7pymDdz4TAx85wL7GycV2vSDShrcAINawIf11qYphqjBwTFdpCyW2pZp1Fxe/g==
X-Gm-Gg: ASbGncvqW3YKCn418EE8PsSDOoPlCj8WWjcRKcj2l2kQxIPjJuhpSCInIDWbtQineiH
	lYncrqD4rzS5j692pCfzRLprHu6iAeT+wGvXCwBVdHDeGbc+eQttSC+rRcZ/73qDxs1Cs0ZpFu6
	bZqsB+v1EkrJSw8vAsbuIR2Q6qeRHYdwwFgMJQ+wEJoi0I+TGqtsZFf0msKTLBK3Hy5igsEulJ6
	x4IhBkUg3ZzV1oyAMEqAar3esWNBqcrpQjlOo/aXP0mGreEF1vhPcOZRpSbP+ifpt27jp3wEjFc
	jGgVCfiqlmZnvIwg+Fxz78gck2B3pwch+4z1vgot2m2aW3AcL9qtbZgIS85SJnTjKbjoUayLo3z
	M+rOwSBqrCr32pwlbX5e65UrpHCN63eXRYNLCihfeFV+NvQkswlZkgMQJWg9J
X-Received: by 2002:a05:6830:4121:b0:7c7:69d9:d8d3 with SMTP id 46e09a7af769-7c958b14598mr3621432a34.12.1764916310251;
        Thu, 04 Dec 2025 22:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmcoFse4hqn7sciuWhsZTMSS0ff1gERNKC989dNHJAgTQduOQUG2UOm0Wwy+zIzf23XkmdmQ==
X-Received: by 2002:a05:6830:4121:b0:7c7:69d9:d8d3 with SMTP id 46e09a7af769-7c958b14598mr3621410a34.12.1764916309854;
        Thu, 04 Dec 2025 22:31:49 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f85e7sm3223326a34.4.2025.12.04.22.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 22:31:49 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 22:31:19 -0800
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-knp-dts-v2-1-596d8398c6d3@oss.qualcomm.com>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
In-Reply-To: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916306; l=903;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UraQRW0HxMz552nMZZUEOzDqeHa7MsNxPseKkAxEQ1E=;
 b=ZK8qvLLUrljEKOqNUSG/MHlaBHc2LNKUPtJKSnruONL790Y+44rc6hFkZ3yOEelNXnOE44tJy
 7qbgbliPoaNApOB4FznF1k22EII5ye6ET7jXOpaES4Bw0uLoa1I14Io
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=69327c56 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8VIqy9Yext5eKz7IjugA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: RzFl-JUiDd7RSOTNriAWJctq6T5vNvDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA0MyBTYWx0ZWRfXwglyEOETTD8Q
 KuNkFeFwFde1f5rna7zOsSFFw7mBWFkL1UCVXO5oRyrsOjAA/HPv/jrnoaTZSio/wrCNNeg1OBd
 QOvs3udIdJNcr48noLaONXwYI2s7VApOZ7R1Nui2HNahylLifVoMA9oxqxeeDeXkBDkujvNbtFU
 IMxN9GsyKT+AS/PSOs5LJ6Q/oVGBQ/dScaj9FuPHjuFtoz3NTmyjRX9fK4o34yznuTmePeJ53N0
 I86dtnalvyWwmZfGDgKSUWnjp9FHfC/3NpGKcVTFC3Kfw/FtGw+TZeebseXStl0Cd9B+BzVSSas
 j4I+ZsJWm+rjGKe46MgBJE5L1e8HqVOWbba82mHXuIZchSAjFpEOG8MBgxBB7I9vlkvrhSKT7VV
 eRlrsU/BHTdqQ+OgXYRsIYVxTJqTig==
X-Proofpoint-GUID: RzFl-JUiDd7RSOTNriAWJctq6T5vNvDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050043

Document the Kaanapali SoC binding and the boards which use it.

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


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590122EF677
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916314; cv=none; b=e6dCUi1Vh/j58fccZ1FpXaBnrY+kh2eC1zatq09gbzfJwWdK31gjRK4ZU8gBluLelL5B0CvrXnINXQBpTPTQJNBcCNtmQCdNkD0HJFO9R1uA5aiRoorEtyYaAa/s9K1ClgXPz5tfmU2HIkqOnEVpGseSmt903d8365zD6RnTxuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916314; c=relaxed/simple;
	bh=Hsq4E4IWiDoqeOJT7w3Hbi8BUUO8MilwTO6vcCmA+Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5w9B1SfhpOGe0k2NxRysPbuzsUpXg5lDPD5OF2eTAmfmsrgGcF0Sqc2SI1/FQEeUllWKTBnm2qZWIuyTcOFD9UxXjZGyxYSp3adUvPpTweWpPbvy50TkIj6GT3+P215PzHhAiFwpz7NBRBx4q2Uj3gsE4gQlJI+lOirkXvOyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBZ3tJPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqV1OHeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBZ3tJPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqV1OHeA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B553oQ93522960
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 06:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3IKbeo1S+3T42iTcf4PfA6A9ayDc4EEHHY1KHTbwX4=; b=GBZ3tJPTtT6/7keG
	NCP5+IiLnnN7PYHRCTUZKspgoMAHmHuc9+8MhgaiqMIU0gGrGLBa5fxMLuHcy31z
	gxjO+1hq1jScfkGoRYP+mGt0ZyuCM5u959S/VuP2mTGhmHYiAiAuAc1VHy2LWtVe
	Yt3ShCHI909/Fx0YpB9aB/mV+AIJVg6PpZJDNFm6GqFgATymPfzVfOQ9Dd7cT48i
	FiDTRavScBuzuOXKT6UkZ9RrjcUtuB/KkMGNCirVwaIeilyG/+RfvKN6IyfE5RgT
	mLRGFy2bBFCWphN+jrt+zwVhz2bGK5B7+Ge7n0BijCqO+CGMjKKQ1XR3r9RF4Ki4
	Iy1i0A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvg6dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 06:31:52 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c6d3685fadso1602671a34.1
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 22:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764916312; x=1765521112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3IKbeo1S+3T42iTcf4PfA6A9ayDc4EEHHY1KHTbwX4=;
        b=RqV1OHeAJwU1pazMP0kJX2uWvMTB2KlFrFLSbAVURSx9A2ppxNeoK1aLm/tNqGQoZc
         dVw3t2edQv7jwAMmPZsypNDgFHO4gxn17AS7rlMtLr0VBgFWLZP459+zo8IQQEFIwcNI
         I0vcFgSnwdOeGjVDsgskpR+dmAIp/PczxylbvHv1JTAKldiQ5H5Gi1vwm+MHJIofN1Y7
         Ku8Q4k8Ssmj4thjWdh1fnm5uZxLoEwAPmsPKIv+M3K7cU6ReH+huNzUtqLUPDrqn7jzE
         DoZYPiwyr5dxMks0edLBPvbLrI+Mes6lwiUcXgS3P5wVlCZxxifdm2J55r1QCCjgw1tJ
         VBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916312; x=1765521112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B3IKbeo1S+3T42iTcf4PfA6A9ayDc4EEHHY1KHTbwX4=;
        b=jZoVxvf2FiEpeHr6jinF/84MPhb8sJrCELHL/8SXYL9miqJ+LimiRQ3Uz4QVULb5pO
         U2diJAIwaTbVL94wdVJJHMFess/yvupViiDvfi8wbx4bZyuWltMD1ZuRwNIiBdPN8vVB
         IOkKrdOT69UUjyyi/8whwLi4hcrFnPpb52Ppj7hLbln7KbrNVUG9nirXKGao0zoxf4+G
         JmNKIRnh224esRlPr1W8i3PUWthzi/nLfiglTQpCngCRU+QK0CuAIYowiRS+O4mWjuE7
         nvdfE547a4GxT1+mpqdK1WFvyGkFmU6z2UrHiDq3CDBLQ0Monk3JmdDgO/SaEtdpZK0E
         M0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHLfuwvpTlSAfiZqROmqmF0BgbjECuEXgSELnIlOzovg1rMINhcsN8buGXWNSEGiQYx5/0B+29i40h4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEK5AdHNBdastuI94js0ch2cmq1I75Tu/G22BCeqGuo7rDQ27
	tJxWo8Rw66StwMOCJzs4zT9/3885BteeB2+ACNU3VCb/CoPYe8Ttf8gvtOmS+tdPjQrZXRZWNlZ
	ycNeLcz6eB3g5eLPJMbP0GvcaNmAykjHERZhOyjf6rSf+AfAbg/XBCnxgdMPMhBASHg==
X-Gm-Gg: ASbGncvfleOIVbn2n/xrKeng6MLZTrBnf7feDQJEYzZxsTvl8X3YpaujGzXR3iX+Xpn
	0MfUFCxkgF4o+zUhq9fk/UPE+h28QryL2ps4eJsT/Pio1tf9p+YE5Tl9CdWz2gWqpp5HPGKGMK1
	1L8BN3UCUt7fBYT/Gdl9oZdPIcKNvMKWfYGVhRij2WHjTE9gJaaBhkRz8e8DnbpSCuJqO4O9bwg
	0n0E6qSNVqJhajatvAD+G5ErCV+ye2/phbiOq6r0/RUXqqs/z9U7v/+7aWCrSHbp+iqwpBDApWD
	5dQ6Yw+MHTYeXw1sndiudWdSwQ0vwLz60su03vi+PvU5Y31UzL3NRQAAv7+gjc2H++/XtMYwU30
	+OT5mjOLkKchXwFPGdJnUYhz+Jffcsg1+/fUL79+eom4Xa9RHsrroZ28pkyBO
X-Received: by 2002:a05:6830:828e:b0:7c9:599d:c538 with SMTP id 46e09a7af769-7c9599dc8f8mr4203421a34.16.1764916311565;
        Thu, 04 Dec 2025 22:31:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkS50obyg+QWu8jBRujpBJATUGpcqovaMXKrG9zrO8j7aNO16NPJEhp5cUt6CnzaRkogyE5A==
X-Received: by 2002:a05:6830:828e:b0:7c9:599d:c538 with SMTP id 46e09a7af769-7c9599dc8f8mr4203400a34.16.1764916311269;
        Thu, 04 Dec 2025 22:31:51 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f85e7sm3223326a34.4.2025.12.04.22.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 22:31:50 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 22:31:20 -0800
Subject: [PATCH v2 2/5] arm64: defconfig: enable clocks, interconnect and
 pinctrl for Qualcomm Kaanapali
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-knp-dts-v2-2-596d8398c6d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916306; l=1491;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Hsq4E4IWiDoqeOJT7w3Hbi8BUUO8MilwTO6vcCmA+Oo=;
 b=5iO/VSBQuzf2vOgC79H+vfnvDpNboIISCKJadFfnxTrcLD3pfJ3qb1oP09uVU33rKuNuKQlzw
 hmRKFwdhBXNC5yPO6+zyqXG43C4x4NGitYJgS0KaePCSMLbhbE5lJhY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA0MyBTYWx0ZWRfX6T/3fXteEyAj
 ehCvRJsPQw6XONx9409SZv98BEtgET1A+07SVN7mFLcjw8cw6yyIXUmuZnD6BBoUfo1GdkPG2Dy
 T7r6sHY37/76JW83gJzl60ZW5RyXu6Dxb91Rkc56k8LKYO3jFmUq7HJRXXIuWDUspVLjYUP+MJr
 QK5PeZxERmGylln9+d8XOzjeuhC28ZtLgbcitO/SkKgMn9kniJ18gx4HmRRULvWjk5EL58pzcF7
 fmRaRRdm+x/wEnMeY/5r6hoZbjpydvoISM1VigaOFbJ8Q0tpDrfSdNAJ9c0ZGLs+/bobkwk0bwM
 uuRDf6srH/zsbA6L7yzgY0VuZv0Cz0p6unMIUWmlRx6/CwnkC4NgcVFBMcOmld+tgX6DYvcRBYR
 Dv/Y82eQFUq3aqrU3rr3Er479PvZaA==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=69327c58 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=agaryqCksHM5hhZjhYUA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: IulN3XarrMD5bzJNVus-LwW7vGUCEN1R
X-Proofpoint-ORIG-GUID: IulN3XarrMD5bzJNVus-LwW7vGUCEN1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050043

Enable necessary drivers for booting Qualcomm Kaanapali QRD and MTP
boards. The serial engine must be properly setup before kernel reach
"init", so UART driver and its dependencies needs to be built in, enable
its dependency GCC, interconnect and pinctrl as built-in meanwhile enable
TCSRCC as module.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cdb7d69e3b24..5aac8878f676 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -642,6 +642,7 @@ CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
+CONFIG_PINCTRL_KAANAPALI=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8953=y
 CONFIG_PINCTRL_MSM8976=y
@@ -1425,6 +1426,8 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_KAANAPALI_GCC=y
+CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
@@ -1801,6 +1804,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y

-- 
2.25.1


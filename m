Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E912980BF
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236840; cv=none; b=N0itlla+ymFiBaVDzW6vFCHkXVglRpP6tNUfKdz+5y24/AAKH8N6bEDwFRFv91TN897RSM4uaZ/Dzt+bJ/UJ/zV3v6CAj44LDJhh/3976W1aNmoYX5txozg3ueQDAPYYd40LuG1klF4f9eEX1aFcRoLlA1R78G3qEb2KrXNzcUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236840; c=relaxed/simple;
	bh=eF9OHglEooMPRkT+RzzUrKW3/CQXaTm6Xts5c9lE7eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1p2U7tcPWClBRFdwQpCBGq5q5tQWA+qDkfM9c9WuhReatfNNrqU6yDSggJWc84NTbotFb4gIy6ZDLdmHn0Qr3Olc1Ag8FBV9E2/3t0LUFj0chI3BorICsOYAj4jOgi9IXzDKlNotQB89v8/KK0L49YutwhGLCXTmxkvGp7kY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BM13EVbj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BM13EVbj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAZK9J003869
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 12:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtZNijnRp1w5BVwcDMHaMUT6uupwS+ihEdb3Rm1l184=; b=BM13EVbjL2HXLpd0
	xEF8zYMCiAcdsd4xLg6veMfZ51PcSCe9qy602k9N1r2P1ww9GwxL2la649S+VCXj
	9pvFQrGO2Rj2WgPCTxknywHA/fseKnehgezNubHY+nhJh6v2Ouc17sUBjAaY/65a
	qVh9egMeXNkbnIA4hCgd5dDvx5yo455N7E8tTShZmUWb9eYScR0W+8JjGV0jfoMV
	gvn9pBHd9ZLIxJc1iyPxVsCPiANud+b7PAVZA9gmJ+uxGlLJJToxOA+qJTqv24By
	o4q3ZN/DaLrAT07swEit1+O6e8Xb1cBxge3e3JdRZ6OhPH9SfJZ4wY6HTg14qtQK
	XuS66w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp0m1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 12:27:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dea67756f4so17865885a.3
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 05:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236835; x=1752841635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtZNijnRp1w5BVwcDMHaMUT6uupwS+ihEdb3Rm1l184=;
        b=E7nLNn0vUPg4LC5GBjkP9peJIxrcHR5HE/Tgk4qNcLIFxU3DEzUAGY1iOnnlDtgjqJ
         eFRNasIJxILFMXYS1JWjWOxN9+AvmQ2AwgeE5pzQsedUsaVrL+53c9tJ18WZhTSuRAnZ
         eGa4cJDgun/C9Avu6YYQnxSVs0nGBnnWyIrUJZjQ5er+cqtaZK2O4i3cvWT9fX9HNSpo
         Y+UeR6SlO/WILCPKHhra9t3Nq5ahzivABpVJU2aLdw8PrC0YUWXoPPDtf3R+EY5GPqMe
         QTD/BiBt6OoWyipldjAFgGIBo923DHiUATVt1bdh57rhlfsxvgTqUkhWkLzNO+m4zoaE
         tG4w==
X-Forwarded-Encrypted: i=1; AJvYcCXaqb3lVUl+P7CO9K52+ijQFD7N2gCMwVB0OS+rGVaCzYeRB1mZz/yS7XF7uPJNcmcsNEFXdSxUAfeSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWbLYME1p+pT4Bua+qrIKDM3cQUYPnatoyFnv+AZSCDL4KQPww
	dFsxcSWmWRNM7nOjKlwbJBijEK10bQSB406QBzEAd8H79WRK5PXndo/CTvDGetKfZMxn/F9udFT
	4SVhWk+A66vAQo0uyfhSRkbi+GeXl5ayFJrnNhmvGDn43gfnHuiUdpjuRyPe6DTDYgg==
X-Gm-Gg: ASbGncvXX+EtZR42hcHcfzGtdMNfgJS68WiAjmHjRa4+SXo/ypG1lJ0vCCxX2wmcSX4
	aJMOFmiqI5eAEKiasoCktB/r/yiqgup4/ZhdxDDhzlQ2HsxU6itlgdUXp8t1rj/2Bax4RdVA8Nj
	qTT4Rr38AfkHutoyg061xc1skQYg9uXshpfqxY6YnqBxOg02XXOGmgD0IWpxwgkbdKwrXb9KjdV
	aASKZlWFk4ehSgM+jxLT28xWDL4hqPqUzpgfg5c1olCrZicyKUM5ZROZAeFg3go1AHuGXXpB2Lz
	RCTXRv7ythiaW5UIKWACExHOmNNjFf8qVz+DKYf4k1FP4NrBNYmTzsv2l+7GEgxOGhhJ/sgne6M
	f1Kx0NmoNKgR5IKBlHEZ/
X-Received: by 2002:a05:620a:280f:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7de9784c3e7mr121623185a.4.1752236834670;
        Fri, 11 Jul 2025 05:27:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOEjFy6nozXjUM7q17Sb+shXEs+/L0eK/zLANGZuXGxAeetPAnbYDbefoGTuUvQLgTLGjhmw==
X-Received: by 2002:a05:620a:280f:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7de9784c3e7mr121620885a.4.1752236834194;
        Fri, 11 Jul 2025 05:27:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826469asm285169666b.85.2025.07.11.05.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:27:13 -0700 (PDT)
Message-ID: <82482857-2bdd-4739-9c27-ec3143c68a09@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:27:11 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 support for PMIV0104
To: Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
 <20250709-sm7635-eusb-repeater-v2-4-b6eff075c097@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-4-b6eff075c097@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4OCBTYWx0ZWRfX7NLeY8nu5CIR
 6oiQK56kERmnnWASaVwy5wnO7TgYqJBvpeUMkoWV3A7zL9aI4BkDFi0U7DhKr1fy3o1t4sJQSx+
 U6apdPkj+F1FzSBn/xijgxkEhm/vqkD/Q4NWvvNnLhDx5Gs3LyQm7laQU70Od5q7RpR9Elyujee
 oEzbGvQ5eoo29g6u6xS2BF2rXKymIditlEYrkvGvstL1j7jMRJDAlmmtFpFo76RqeYRuRMSk3ej
 zkYbp8c5Y4HtDYgWnoQ0L14RLWjyuyPjvsuAiM5IG8ODzlWkaAL0Rcxe8UIzQ9Aq0cyyh7geAQB
 RCm9PLcP4PMaQ6KeHt9b8cEbVdQ4GFcOD497xAPkDjh0e0IGCdr3G4yxlGIh7nKJKdPV5PAU5ZU
 ATRmkP4ltKMOJk+52lxoUfQDWdP6Fu4/N9WZuNfILzXqpYO1QJiJnC1xkfahbusWxZAklp7I
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=68710325 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=9PpJxbGV6q8lFR2oJlIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: QDO9lUlPItbvY95WEGM_NMOTiZC8RYpV
X-Proofpoint-GUID: QDO9lUlPItbvY95WEGM_NMOTiZC8RYpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110088

On 7/9/25 4:55 PM, Luca Weiss wrote:
> Add support for the eUSB2 repeater found on the PMIV0104. There is no
> default init table for this PMIC, just the board-specific tuning
> parameters are used on top of the default tuning values.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index 61594739e5b12706775622e1f76af6ad5d2d29bf..3d4cdc4c18becd8efd5015e698b836ad4d7cf18c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -82,6 +82,14 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
>  	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
>  };
>  
> +static const struct eusb2_repeater_cfg pmiv0104_eusb2_cfg = {
> +	/* No PMIC-specific init sequence, only board level tuning via DT */
> +	.init_tbl	= (struct eusb2_repeater_init_tbl_reg[]) {},
> +	.init_tbl_num	= 0,

NULL / omitted fields would be fine too fwiw

Konrad

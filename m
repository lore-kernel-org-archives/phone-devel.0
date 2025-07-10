Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127E244694
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149455; cv=none; b=OiBCZCBpbEltNN9fgmVCKHBCE0WyN31jfihgOj6XvrLloR0quxkXxsxlcA4NPbmBery0ak1Ip13hOdKoZUDcoxPtfBvx3Fh9+evdqGgPrc0VUFPYCNxpsCAAUwF12QYivxeX2vvBNhJy3cfI1cPJUZTntASP/8sctYCR4MUA/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149455; c=relaxed/simple;
	bh=3WpSLx1lOvBgBlWtCmaes9/MUjWZbRyaDXKVUI5jEkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaPaEP65GB+ZZjdIVnIOglq+Lg9iv1rShBosO4Iw3J5Jd3fIznZKCYjb9/VziyGRr0im/l4RoGzzVkqsW0Li63S4/fJ2TgERHE7oaCTdEdeW7xvODbxjct/0yIYeB5eVjAmbEg8KqFPpcRawRsDI9UZRNhfK73HcOFPc9lXDYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC4i460z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC4i460z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6GdM4022595
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qylshFqGhjqdpqss4EWahA3a0P0XpI5R9ccWJmm4pUM=; b=HC4i460zUPUFENA3
	MjRi8M3dzKhyuwssANgdh7k8mfip5nLU8X7F1JLj/sxneVaa7iaUdR15UzXVOO1F
	ImzFzHvTm3/blYiN9gmEt4eFM+SKwfcWqWcLM5UUWm+cNkd4TvGlDZQkev5fv2sT
	TcFrMkRA6al43ifj2jkubAJs3FrUfNvtZkkkcVcB4X5gGng2otxgKTuXqt6KlQyp
	dcUR+PaPy4JSoiLFp59cAR7s6aGWZ6mI3ejAN7yQdgXz2XAOshrFt26Xpk6Yu27Q
	bXAA1+6Ihl0EE1FsykzY+81TpsEqFSxeR8ojjOmPNiMs9ZCfJm++Ekb9bCaLzkT1
	Z5N+Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u141q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso25180885a.2
        for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 05:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752149452; x=1752754252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qylshFqGhjqdpqss4EWahA3a0P0XpI5R9ccWJmm4pUM=;
        b=qhMiyGh9UxcRyUDKT3Z5O10/ollxbanc6xXgU77RfBJD0KV299u30tHZdZLiDp+4bh
         3Xw629y4VQySWONOjKP5ucLUnAtbUUGEd2olZOHb8lZ737I06KD0aYOnf517QNPVOn2W
         O+ZSdxB5my1/pBmpz8VE/WFx9taSEAuCyaZ7MQ5C7l9oic28XLTeo89Knam/OjCkBTcC
         52Qq5a3q0jk2bMltcEBhtRTX1CbNaOqD++riP1GTzIO/XfKqHg026R+vubhGHwWr7bM8
         u5cCsFSRg3wJL9xpeX6gNiv98Ob+N71VI6b6bU/zwtRHn2IPMOsPzsQ4RB0f8RlMUFAC
         W/fw==
X-Forwarded-Encrypted: i=1; AJvYcCWSVnCzJ+XVKXuz5sWf6h+MBlhZMnALPFqki9V9YY134iNSnjpwu/70WZVY7T51Sug1LYOQKLoYa6kzSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuf/aJU7HX+i/ayUH2XZns6R4whUkfIjOrwiQNWTD9Z776+OgF
	3z2oViAtijnTPkoexjRq/N18+zBSABsre4ID1aFbp55jfF3TZ1KhWr7FqIXVNIyMrGinJvVPmD8
	nkGzKni7IaACoOie9kZg4toO82tbXS4sDyDrfhUR7u7HeFR0EvjIxyXyE66xB8DAK4Q==
X-Gm-Gg: ASbGncuALE3oBqcSWXZ7F71k3JaeRproK4bAE2fl/ylB2fKM6dqz/20dKysGbdIyMdN
	/QED2lgZG3iA7Hja3UCaIAFbtI/OnNyU6Yqf2JzZLXrQWLVAqrCITr5AbptfXaQmJJjGl4liNhQ
	rnQSlOsIwWRMF2iKFMcDA0wryS2MxfAwV/FgoCbR/nK471Swjiyv77B9mZr4hq0GKHJsTpx3Sh9
	+0rY0T3WL0eWEu9RdhENb1Nqrcp3KauKrmvke1AYKPYD2S5ndrj0SEz07LAYOEtAIpNAYtWgQbs
	Uen0E1d03FjVgD0cy/1wEUxJ2YYkecr8q6u31YRjYWHwHOY/M03D57pBka/Sym6+8en0ej+/936
	kKvQ=
X-Received: by 2002:a05:620a:470d:b0:7c5:687f:d79d with SMTP id af79cd13be357-7db8ec65af8mr344978185a.8.1752149451773;
        Thu, 10 Jul 2025 05:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNdXIlzeTaHsQw8JV+VNgiKFo/GTeGYtHM7NPf/e+vpsxjpM2ZxW4+HG2cXIrSvCR3dYQdRw==
X-Received: by 2002:a05:620a:470d:b0:7c5:687f:d79d with SMTP id af79cd13be357-7db8ec65af8mr344975285a.8.1752149451347;
        Thu, 10 Jul 2025 05:10:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bd9sm121061566b.132.2025.07.10.05.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:10:50 -0700 (PDT)
Message-ID: <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:10:47 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: in_d7fyKRRcZZQ0aGLmjyoMw2lFGkXMF
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fadcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=JvZHP73eehLcbYbFTREA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNCBTYWx0ZWRfXxuMqgOI6aotq
 4Zazw9ak4ewK3rNzr5SrpDaZZcXB9+u18oZCtFfKzlfJlRxaQRTXDJmE+OEzJNWDNSlsRC0JZPp
 ZIQ+yrUKuuSfmCDYKrGTcRVaxn8D/FkLOxKPqGmbxr9OReex5wsmeooDFYjDT8FevU7Gbl3dX7D
 EyItwU0K9eZaXK42GAO/2+880Knlt5RlJaavp8GxIaQjLjRgvpX744rG+yQah2uwurTMHL6HkFa
 OHaMdO+G7q4FCHM7aK6oEivOaG9pZOw6Ei3NwHu0TASmRZftDIcfuh+zyFSVc4bWAc3IXsBGFPg
 876saJkVLE8wphYEs0O6YAHtP6U8vlpaT7fPa7TonHvhHnYRXJmwLvHZBuqPhJqkfMnFiVXxhFz
 XwOLxWcyIwHPbws5eN5aYkZU1DgoZLf21Up1oGtOExpiyxqt7O9iOaZ0YfDXlT5vg8pxJvi6
X-Proofpoint-GUID: in_d7fyKRRcZZQ0aGLmjyoMw2lFGkXMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100104

On 7/9/25 11:18 AM, Luca Weiss wrote:
> As per the downstream devicetree for Milos, add a register write for
> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> The downstream driver supports an arbitrary extra init sequence via
> qcom,param-override-seq.
> 
> volcano-usb.dtsi has the following which is implemented in this patch:
> 
>     /* eUSB2 HPG version 1.0.2 update */
>     qcom,param-override-seq =
>             <0x00 0x58>;
> ---
>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870aa7f7971a51d4a567 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>  	/* set default parameters */
>  	qcom_eusb2_default_parameters(phy);
>  
> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy")) {
> +		/* eUSB2 HPG version 1.0.2 update */
> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);

Said HPG asks to clear bits [7:1] on all targets

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD43BA23F
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159686; cv=none; b=ZneQvzAz/ilasHcNtSCKI82T73u3AwD+7B43YU9FBmziUizQrEAx2v3zc6VKQTXSDcllxGhM/s8RLhNWwM9JQ7hRldNhcqmzf2TGqkzagpmMdb7HQ4fy9ikGtfFFqtEnhig2Gab4CXBtuZngpMGtP7DD3EINaBnrxLP8YOWEslY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159686; c=relaxed/simple;
	bh=MSMc+Vupw6OBt2TRATno1Be0rh1dgFO8N5/ngx1YRBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXv/EJW0bVwCEx0S2D55Z9xzSOJfFWupuMSkK//owXGfLOtybgpuRPS73dDAlj35ZcJfIIRKDKDTdORilXJQBkvfsIAs6P1Z4VPKWRc2rFJx7Fznjr4jt2EcXQ86BnRGHmJo/qGiECHlOy74th3a96ctf9U7U6jfiAjNXdxbrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzyBjo7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErkE0Flu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzyBjo7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErkE0Flu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6NTpK2633313
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=; b=hzyBjo7F+6LH80T1
	jScrahL/p/ngMgccM5cZfU0DYCqY/ei4+RNgaDc0WGLA70gCk91bsCXogbf93tks
	s1b9Ij0D07WdFwBskx+RBbOLlwnIRP+zN6GRbzex/mzw2RYYo1oj2VmLzWHxlPxF
	+hILN5uOi6vbTFTHd7j61elkhF1srUIf4OXgQKHleXLfdZ/2ZJYMX0icwWWyqUjh
	IdyDLyU8y5YdXqtnx6uTvu63uEal15/B4a7tI6x3wSO8stfAAjJUeGoyyIWcLdW/
	pPeactPbDoQvGmytjgIynF2xWfDCCtb08eC+EnzUUX9EsdniNcDgglSPLCzqDgVK
	2M44Vw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca4mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:41:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d7128e038so13221391cf.2
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 02:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159684; x=1776764484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=ErkE0Flu/aRSo7nDgWfODyOAcCKjreVKmshisl5jfL9SMXpTzqNz5BmxU7UseuyY38
         MiIKqpwsMSQJVs2O6CUmOemeeFDu89S5zWCNWcbpYAGnw+9CcLCIGsqSVYXoe78OE5at
         f2+/rb+Jiu2jsNvNzeJJgEyaQoCoTpMIPVqGUmnaxwYDeeZ9wk0jYSiAwGn0MkmvZVPn
         SUTlBqB58XoWVQit8OhEl9i3sU/EJWNDGIGKZToZMmk7APFAl1GIA2EGwF6kV1/kbNMT
         GmQ82QAe4Jxq1YxZRMzrdb0lc40yKEcKCISJ/7AkRybZvKjgLvKKhXIRKum1hbQkssjB
         CYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159684; x=1776764484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=Ot0VkOD4ILCFm3lvYPIYvCjC69g+L6WqpMaJrZbyFqjOw01FN62c+3HpjZLbiZ1kF1
         w98JQtF/G+ECmwxsHQ9/IlWtwLDlkzbEIMgbWYeA8/XmJiFEiP0jn2UymGzf7YJUvVfR
         DmWiG3cndOb9ehNdS/N2itaBW+eb9NwxLLK9zcfXBo/kuxYjhObP5P1cZgaiFnQMfoB8
         W8j8YLQsAXVwuvOYmHtqolKkiLRTXhsX1WRbRcOsPtFXhvasVJhWl8V8+60ATZAqR/IT
         3Me3ZgWUQUSDYJG9lCHs4omVtGmATCmEmB02TaBC36WEW3TzGR0yMluWX9C9LzuSdpJB
         PFNw==
X-Forwarded-Encrypted: i=1; AFNElJ8jjUOKTF4CYlighP3ljsUBBDNZsALF/xuIc0RSI+pjbXs6tu4S2zTK0o1NAFaRJ/z3LExy5ZcffUmrGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMq+aWynIUEcPlZr3klAdnGNlyQ7r54Z5KaE/igUP4lWhSUdA
	1iHEbG7MClehx9syId/YkWr5oWnH7GW22rMryJKJkor6mdS7B1EHTXQm4BT2fHBlBVy3s825NVN
	zA7YFD8HGhMpLTJvuSWkxAMZV/K+wfprQ4Ct5nauMZlT/EFbFYPSAqs3LB8UG86gXMw==
X-Gm-Gg: AeBDietri9nlAQAShwlIqzY3c+v7lnu+JhLL6ft143MyZswhuHVcmEH6Bi/B8hrPglA
	q7QRmxaPy6zyCaKUdIT++a4Jv2A2i9F0hDyab/+R0oAjoKJIgLqR6i9i5dYkXqDsnY4AsUiJ70P
	STNoAzEt/cbLlMIkdc/cnRy/XNcK373+gCFG4c05dN1Fzze0MdKyp5Hqhrp0C7cXDfvCZE0GfOU
	jL61bF39Xw5gPiBEdDm9eHQk9FXKlHSa74AwgRqBlPrXeaG4S63PN4oe4/cGbVJBvenZpG3VkDT
	V8CIC1wikvLLC/aGtTrhYiS1vOLxHcS3dQlMRp+4suFPfYHY8CajvPvw4GN1fZTnkT209Y7NSBm
	aCdI8yAXbvncDODO0cjrp1BL4AHMlO8YmqFVbzMLdtYJ2OGpK5PKssZ97o4ZCcMriI+u3WKbG41
	BR1F0LN1+QM4WhOQ==
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301361cf.6.1776159683849;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301091cf.6.1776159683256;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c89fasm384601666b.49.2026.04.14.02.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:41:22 -0700 (PDT)
Message-ID: <db41fea8-8738-42c7-8575-ddaca999620b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:41:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and
 Bluetooth
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jXbG-jjSJ7vswRG6KUzB9TkI15EG45az
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0bc4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=6yk2MuD3qlwx9g5reDkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MCBTYWx0ZWRfX14T36+aW24gP
 F0iTPREuVt6UU7ff93IA3CHpE9apBKnHwm6Mdkg01WO65KV3liGOSvZSShttYlsFAOjmJbZyCVn
 Gq/11THwJjV3STbvgaf58VdnOzHYnyt8Io0+Ad/9ipet62hSOVLPoXaTCCqXSiSt0qDGHfgk6+l
 0NCr6awpeyqF+VAAfOlviBSYuK+K+aFbIszzubuiZ5KbVaYWcUykpKi40OmbvDIB7PwwVaky32i
 kK400dArzlA3X0aiZfr2//t8DY5mRMT0Wq40b3D6A5Nx/vwnPkz4z9U/DDPa/mtuFTgr+2kelrl
 Ki552jcoUYa1+Q5TpqG4PYlHnurG8VHc9IgwrrrO+E5H8ZOp0JaZyDlkF1UO/qWdVAcbS4z5VI2
 fLdxGwBFjfsmVphgD30n/IX1QtPIS1VFA8R+wUq4P5ernOCIkCstQcKCxmwNFqE5dq30loRyMM2
 XMFzj9tp4X3qDlRjs4g==
X-Proofpoint-GUID: jXbG-jjSJ7vswRG6KUzB9TkI15EG45az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140090

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> index 591dc837e600..79fa9bd038f2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> @@ -95,6 +95,25 @@ MATRIX_KEY(1, 1, KEY_CAMERA)
>  	status = "okay";
>  };
>  
> +&riva {
> +	pinctrl-0 = <&riva_wlan_default_state>, <&riva_bt_default_state>;
> +	pinctrl-1 = <&riva_wlan_sleep_state>, <&riva_bt_sleep_state>;
> +	pinctrl-names = "default", "sleep";

You can probably move these pinctrl assignments to the SoC DTSI

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

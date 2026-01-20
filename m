Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6D44CAC6
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920573; cv=none; b=B+7Uml35EEJrLZtpy9nGhg0aGSI7fwAkrq678nDTnkmL32xtWWRjm/z+oUJ2FhmdGnDdlqvRX3F4oYsDxvSxg29lU529/F0lE3tTaCcB22iaT0nH1NMwPGamjWJOdKVf0bjz5qCjSykqT1HizGhJ/n6pZcvtptRRcWnKmymay+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920573; c=relaxed/simple;
	bh=cld2wmZoJ3rj/J+xhTxAwklwv2ytG7pFtjjFpgprF+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWX2SLf3ufx0AXRAV3kH6zyViAaU6ETpba7Fo5YZpWYksArgo+UfKqB965U61qi/2dtVjvJ3fCj2bHK3+Xl35sKvWBBhP2SlHSlxyGpuYCU4FxQ5HP2SekBnBUt5So+ecJzTb7dzQsOl0czAgUSFyrkzpoq78Uky75ic/8fD9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khOALW+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjUOnQK/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khOALW+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjUOnQK/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDgaqx782007
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LVjRE4VxYV0zLdBnpQoBaqo4
	k87tJBm7GQsAW6vpzJo=; b=khOALW+bmfx8LK59WwyLADZYon7JsYdr2uxX9Mns
	jt9gJUfTD4WM1Xm+/YST1wZkuRNDD82fzK7xaFJLio/6A4tjrnrobr6vckTTqtCn
	MfwEAyWQDRRSBwsmQ+haNjLdXMWA1VJxF7twx6M7wdqgnfIYBk1IUPsa0a3hEFM/
	PyJWoLy7TirDtPszqrXKF0PBTB2nWM89Js5V10/xXdH5jCHeXw++ORSNU7FfTwV6
	T/eJDbqHiAXixM/vmIKrEdJZubJYx4Q89KxZyEZTSlS92BcGigeXZW66iENFRQus
	tN1ElgnqcN48ETp0LgGAkC6uCiqnKJgPWE2dn2hXjErk1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatyr6q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:49:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so162865185a.2
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 06:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768920570; x=1769525370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVjRE4VxYV0zLdBnpQoBaqo4k87tJBm7GQsAW6vpzJo=;
        b=GjUOnQK/T6mqXJfCMS4rqtB8/wEUPCHl0cgrqahEY9XH+OI+63y6+vsf4JEunncPVS
         1GUyUGRoSxIFGrYTqoA9EYmGzd1hQ1/A8s2817Dvh4qp+sICfTKFtDBdeRsSIcdyti3v
         rFmxZsZIlVT0WQthoLylCQSxuzzJvPxmIHY523wAqgNmdD9W/3jfgbdAL6RYRvrA20bq
         Hu+yyJZpbT5E/Mnq3vBOkmsQ8kSlsnAqOHxBvI+eAbP+yTkoShf8zGu8WNU1gqBo8leC
         7QXQ2ShqGqS0KFZ09uFrdSAJE9r3KSMXWI+paBKxsaHUcLfKyoW9ihwVuBVNxL7p7QD9
         YLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920570; x=1769525370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVjRE4VxYV0zLdBnpQoBaqo4k87tJBm7GQsAW6vpzJo=;
        b=MKg318zYGwDQlBBoiurT1yzKv+Ao12ksJWN7pGDoTSRfOIZ50Xb7br+BZ01qa+3CAA
         3v4om/VDhOnc0ZolFpFzByk7lXU7khUfLHhOIh52ySjIfdkK2r6hYcoPCGQwJfX3geK2
         2SQl3Ubc/vtvPt1UoYiCcDBsYPRA7dIcr/GKwDqlih6n9N56UjebMe6ccBfTG0WmBTPW
         aphdsPMgzAC5XrENJmDgRMW/biAZyXGeThMFknq2AX90CbnVATfDP7f0FfDvVvuzBgkZ
         fWMSMairArgJnPs72sQ+rk/jjRg/e+cfiteIeO8CMhUyyewxS+aZvG/xsAjkjylYLUjr
         aJDg==
X-Forwarded-Encrypted: i=1; AJvYcCVMaCbMbE4MRZQNE6KUp4ua5483a8bjECsxFFifM5JLAnOFromFzALvVkFXgNyrbP23U5cwnG/NOOZv/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUknxFDbiQg5lkCxZb/qX0DLjVp0Mnv97cwngg5GWk/tqYmmRB
	0Nqq+R3BXmHY8wDmGD3+vdy9nC0lMxs9msh1YWdKlAIVzEvxhLtD1zboFCD59ftxS+VdjG+fhrr
	HZV1MyRBKXcoyw3OLY3/pr0zPTI1YD4unC0yae+liscxjgJHJUD0U8lLK+lMDe0NaLg==
X-Gm-Gg: AY/fxX4IL7cICSTnmJ8N9MmKe3WlClnX1CGMXoT2BYw7D7To+6dGRq07qL0JeKpqdZx
	5ML4EXKDnAWGW2q8dxhAGpgt8uq09TXilTZDUncG3J0ApNpVJSRj1S9PhYgoZhIgVGg88vc5FPe
	nQoY7ZgKJDPSGmdSDAKnj4xXxs9cgPHBwSvZpqXlwSuyNl2KTA3nOCfGyNjJ+z6LgxxA/myqEZ8
	AaszKf++F5i6QI+3fjBfZxsaw002qFWSz/A7DZF8T89yzyeLZ1yC1kZRtxjETIUbT6fgRuymsWk
	UmdgqXWp+EswBGRdNBrSKr0yM39V88AhKjqkYmUuWWXt+zLuK2amZmGW5JO8nn2XKaj/Q5x4esA
	qJ9PWjtOLCCe4f7RwjJaAyXln
X-Received: by 2002:a05:620a:17a3:b0:8b2:f182:694e with SMTP id af79cd13be357-8c6a6945228mr1898004685a.54.1768920570005;
        Tue, 20 Jan 2026 06:49:30 -0800 (PST)
X-Received: by 2002:a05:620a:17a3:b0:8b2:f182:694e with SMTP id af79cd13be357-8c6a6945228mr1898000585a.54.1768920569328;
        Tue, 20 Jan 2026 06:49:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm13235856a12.24.2026.01.20.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:49:28 -0800 (PST)
Date: Tue, 20 Jan 2026 16:49:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <zvagnaxqgrpm6bagw6zuov4oi6o4b7vmy673oh5st22tec2swl@abvblxgray2s>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMyBTYWx0ZWRfX4iXhb6eCEznI
 8yNPIu5IKKknOPzdmoWvVY5qU4HLarW//tAB/o0hr1OER6k+9RN1fOMj1X0N4opvJ3nEYmWKhsi
 YMrgsNSxPU/CIb1/U7KbxW4TAyos8TXzXQtTgba3eZrvLL7ruIvgt3DoLvzVIKP0pYUk9tCpiBn
 u3/w16dg76kLSTb1TLKTk4bLzcYps6x/erjPAfLMZUGysBq6mkzRqdCZi++tppgniT8P9/He3MI
 256nVQ7Qg414xQx5A2wpYEN2gb0cgFlxqbIAwg+z1J4HFZY79U1sbYtJI0SoqE2MQ+C7i46iygd
 T3mjPRo4nPPsPNvQ4w58Z2zY3VQs/uFv7XuHIFscb8QjZzZCuv93sa8ig26Kp+o8BtBo9KCNkwo
 mn48XSYOJCHkm3I8N5HIG0+5TEHX2bEHlEh7d9MIiT2mhnM8VEwLNzUWproR41f8y/XZV9v1RC5
 HrOF6zrC5nN5MPzwWSw==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=696f95fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=0k69HSTtqGF5rPJBr-4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 6wuHSB4B3d7lFk44rr_yk85_0TnlxNNq
X-Proofpoint-ORIG-GUID: 6wuHSB4B3d7lFk44rr_yk85_0TnlxNNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200123

On 26-01-12 14:53:18, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 129 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..7c8a84bfaee1 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1151,6 +1151,129 @@ aggre2_noc: interconnect@1700000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,milos-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_UFS_CLKREF_EN>;
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_hc: ufshc@1d84000 {
> +			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,

Maybe I'm looking at the wrong documentation, but it doesn't seem to exist
such clock on Milos. It does exist on SM8650 though. So maybe the TCSR CC
driver is not really that much compatible between these two platforms.

I take it that the UFS works. Maybe because the actual TCSR UFS clkref
is left enabled at boot?

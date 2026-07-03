Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332F9381EB7
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085493; cv=none; b=mqzeY01CyTm3oGbxYZQGtmOxP04b6YA4XeocF6HpZHSD8KPwoHFNTPRpuIH+rIZ9peS0UTBXdxzspy8+dBAYuvYZdqtSLj0m+0wEopRaYL4gmndVZpFJ8t0HYm8y0zUIQ5xrOjT7VVfVUyO6oDw7eqqHQkou2ox6h7mSNiZMtq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085493; c=relaxed/simple;
	bh=vAT1lNSIa/PrMnhwIJYzBDd3jyA6FVn2AwWFXgDKoMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFPO9k/vL94ntBUlSYescLqAiTi+jlx4NWlINmZRaYY5CtgdDs6MC6oAIsut84s+XY0PUDAwCuvw8q3ChB4r622bxvdXZGWd5wijRCLqXgPjSg83rUvGWek6EzirSaq7pqcndJBLpf3B+PpfUjspQ1MfHG24Atw0sQvtzgrkFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN60XDbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRMUoTfI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AN60XDbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRMUoTfI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BIaZW3054057
	for <phone-devel@vger.kernel.org>; Fri, 3 Jul 2026 13:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=; b=AN60XDbpjhkXSQzi
	ujOiH8Ua/axnEYIpjmylkBhFMJs10MVOJgfpAsvW26HxIm0q6exCqcCbeTQfJjuJ
	KCY5q/6Ws7IUFevmP6oM9a/1widCprfM16S1Dqk0Y2H+ffhz9EcbbsUG49oXVjTI
	LuqxFol3o5PHGoCIT/IhLFXwMr96Xyv/8s/DKfC6iWurEMri9dbmUMKLGNMU5krp
	y2HHYTJqAlKK+E4CT/Xs+ULZIsJTevsDFGo7EFrzeh5X3/wzOleysBgUSej0AJuN
	sMbXT0rckSFjD2u9h8UFrrokXch72TLy24//2PlAPWwgFhtPrdpAP+dyiOeuJvte
	fzDvyg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01n3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 13:31:31 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e5fb37ac4bso56846a34.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783085490; x=1783690290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=;
        b=kRMUoTfI+wXHofkIYYSOsIIfsmwicfOPmAg8SlK7FjYsOpiaBZyyZo2nPGeUA0d8vu
         4PCFxwSplDbE4tLICzTpOhG0+Ef10nY0UdibCZK9siBGyVro/2KzTB9k31y5HVCdBFx5
         098NBPPSgOwSUw3wuqnAaQKLF4jWQSr19XtpmuZMwqyteIgrwT/DiNm+NuKZuVlATXq7
         s2VkJDDxMF0PZBIlrgY8yfHFJktEutP0/CVqu7Do375QsZblD09AJRjGDpow7k4sTBqx
         4BdxUKPqxJ0lwqDEhR45RIfSJDrxZpTNh5eJF6O1kVw4/jLR6CCD082h0eQFv1KMdYE6
         Auyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085490; x=1783690290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=;
        b=eeuY1uimEq1fvSZdncnQqQRnjJ/Xeq3RhvHltsMPs9blC2ja3Wm6fat/k/W8W8WpBB
         0K4pe68IJAYQZMr+Oq93otCEE7+K26V+VvBfgePTPgtOFpJPLdRqoHcWnx++PGi+VVbF
         67WkYrqe09FOsv3QlalLJXBTeMoUkeJCm8snNeRvbhLdVvKOeBBr29hcWucHHzYVKSxY
         sypMwLQWw9Zk9EXBg4oHC9omvR8AbMMvv4cPqFe/o1/dH2yN+DXV1TkmPB1oMhKv699m
         +wUQASYKzgTCLDd+gfTXeymHCaEGSqmeQ7/sUQ1OxdzbzDB9OVnVkt8IqXgWGnNfz0nl
         MZqA==
X-Forwarded-Encrypted: i=1; AFNElJ8u04poGHp/C/FedbdBGHRxLlKyp8r85j5chFPimUr7R+Ghke00Lmc7lh+0KAxeyUJ7SULazumJZ0L6cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHtVq9WmvqteelkoYdWnPgXJcoqpprXZ1EM+thyNSlvtTR/PK
	J08SxVQduMdFjajYe03Ombjggy2egqAO1VDm8kMkRJitpyms9t5YT/hJaBFy+ET7a7cG8RtsC1X
	MPxW6+XFWIw4+EGELPxAmSSbm/g6hFNIFaZMOg6rDX3BVdBqbh1Fo6NicM2+jfvFlCA==
X-Gm-Gg: AfdE7cnxra2HEojjTsoNEGpgbYa6fkdFfQWdxOyKnqAkBtCSQ8G9o4S4dxK6mVAkz8+
	fFH3W8tmp3/aH+4L79SUskgoEJWblvZI3npNekiNSOGPrw4ewUnmSC3JtEXmLu4QvNXXv61M6X4
	MR7zMtuu+lcrSRSddnlYHN38R/Leu5SX27xLmveiS/mait9fHfAnQ1YlD+MESWTc5r58cgKXG+E
	rBNFCUQNtQDq/wKu+3/3JHbuRxBY7UsLDpdgVRFQN0eG57yEVRLV38RA17gCom9m7QzWlYAWo1E
	3W91hCbD3CcnUW6uGhzeH0z3OG0FVKPBrzqpuBzckRJJ/cuQbVx2+DjHO76y3T13N5lcaxZzOO8
	zG6VXymDLx+x2waQ0PPq6M4x+q2kJfNgRdcM=
X-Received: by 2002:a05:6830:2696:b0:7e9:d089:d7bf with SMTP id 46e09a7af769-7eb4cc1678dmr4643687a34.4.1783085490521;
        Fri, 03 Jul 2026 06:31:30 -0700 (PDT)
X-Received: by 2002:a05:6830:2696:b0:7e9:d089:d7bf with SMTP id 46e09a7af769-7eb4cc1678dmr4643659a34.4.1783085490043;
        Fri, 03 Jul 2026 06:31:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c134sm277001666b.36.2026.07.03.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:31:29 -0700 (PDT)
Message-ID: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:31:26 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mXwyNkrPHSpD_m_XI5PuIwoIuBs5zsaY
X-Proofpoint-ORIG-GUID: mXwyNkrPHSpD_m_XI5PuIwoIuBs5zsaY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMiBTYWx0ZWRfX4YJgwGHffeUM
 juER7aOP8pfw/PbrZVK1enZE9Ma7P/1QS/Oa1cu9DA4Chafhbcck7RZJP1c9bSI+k9XzT+BAB+0
 d/I5BjBthdCR4cX3B65tiJ+vNZRT/nI=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47b9b3 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=h45PUBSeg-F0hSU9p9MA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMiBTYWx0ZWRfX+7j1XZjGpj5C
 3ErUW5PwV0m6Bga7obE2Z6dDYK6RPKISkTLs4haHme548aCLlXeDfwj5ggqPxqV71w1x+JYZ2vu
 h6AptZ+ssgc+rzEotGFVag/8LfV01l4w7f8qCfig1WEul9Lbr03qVKlOEWqcbs+EE4x8XmCI73g
 sWIbrU1heNFg2Qe47NlREHMiPh+yQ1l89EVu6ZlM0b2g5SChITlTVUXkAqtIFDdcHCk+o7E8ST6
 ZV1mMgQ3e39/cVEjoVC8yua6FO5w8km0vgUOlE8Li5k5B5UGH5GacJWKSzHNXIBCj2bkaXE+4fO
 gpLVpoeToWBpMGg+CmZ234W5Mwoblmyv6/wFIMjjrtNghJ9nVUt30lEH0AXn9g3hBL9EyFfSX7v
 cngdwsslZppsrGFmTooSNkkwjScP2JIJnyiTnnp0Xvqdi9go5llvdxv6RwMnezTgrF2Xk6XrszB
 JfjD8StYSkKD8Ya9feg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030132

On 7/3/26 9:59 AM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:

[...]

hello, mainly just style nits

> +		rmtfs_mem: memory@f4f01000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf4f01000 0 0x200000>;

0 -> 0x0 (also in all similar cases)

[...]


> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_vol_up_default>, <&hall_sensor_default>;

property-n
property-names

[...]

> +&apps_rsc {
> +	pm6150-rpmh-regulators {
> +		compatible = "qcom,pm6150-rpmh-regulators";
> +		qcom,pmic-id = "a";

have vou verified your reg settings? incorrect ones may lead to
hw damage

[...]


> +&pm6150_pon {
> +	/* LinuxLoader fastboot implementation has most of it's commands removed
> +	 * by Samsung, making it useless. So reboot to Odin download mode instead.
> +	 */

/*
 * foo
 */


> +	mode-bootloader = <0x15>;
> +};
> +
> +&pm6150_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

let's keep an \n before 'status'

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <59 4>;

Do we know what they're connected to? If so, please add a comment, like
in glymur-crd.dtsi

[...]

> +&usb_1 {
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";

Does super-speed not work (if you also remove the qcom,select... above)?

Konrad

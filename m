Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA99943CEDD
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512474; cv=none; b=ly4sT8pkottR3mGgczjT1Zf9pQnPaSftl2I2Peo9wLPsO2IAuGmCTVvlSDjKtj9FrKk2strPgmjGyJXepZi1yXxGUaay5FrtMYUEnXcvQ6G/1pTrWmwExM2/dwwz/C1SplwulxgleyDIKQzCfH3kKz+u+TmGXECXe1UusRsu2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512474; c=relaxed/simple;
	bh=w44NQ7CGfCjEIC77H9KkwhhTGq6i+jRPjW0DFv4GItQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inunKRnEDwFc3/Bl2LgOGbKpL8g0XwESOraywCDZTCdZWPeuxKWeZ+pqRREyq4aXjvDldB6x3zfe9rJZhXx2Jx9iFHzwER0Pa3Y0IMihspuKskxZx0bUAzfpSKkv2a5EcC3k1oCwJk/Y7uDwEpiuIcGGYswFftijefYQHyHeiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Njx/jRnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRIcKPmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Njx/jRnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRIcKPmn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONML489212
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 15:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6LlL2aWIX7N9cP3QSxIY897bTTboUlJ4EFUK8JK0Pk=; b=Njx/jRnWrkqDys70
	M9noEftidN4lnaa7xOGlOSNDBe9WrXoRwnnWE7ec2vstTXqv1Z9nd1H2zGje47az
	QzGjSsVILfIHvaebLo7G8Cz1U5We4cZ/q78XiZwqoFqL+TxbXnmv9I2hW8bt4h+x
	Z75jfO31ChCAbFTebhkNn0EfmPDt30LvCc4DHNwGw3j6HOsNTStu6kecRdU8K+hu
	VwQV61TfyyOxSvTx9aVDjVX7RIJ4Zlcr0Ewh3W3+kjEG8Kl8PmoqvxZpcMAO0Pa+
	nS3UK44QX6kYxgCGIX/45tTBS+/SOaCx96PIaWGdOuI+KCMYWXeR8uVSRm9NmZWA
	QEp2/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8rxbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 15:41:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so1602541cf.0
        for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785512471; x=1786117271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6LlL2aWIX7N9cP3QSxIY897bTTboUlJ4EFUK8JK0Pk=;
        b=cRIcKPmnOcMyjk7LH0xtQjIaKUa1MBJYbNX0VyLAbT4nEx7RmSmqiG6IakNY/u/NGC
         250MnJ2nC2xgZhod1PdkySkS0B6QrJHaPyFxOlmUjZeksk69W6FZ1ZsupZofhviviarY
         43OpQ5Jrm+Hliq3Yn6FbCMaIOVrczXwNllo6qt+0GbKHJ1o0JF9uCZDf9MoxzDd4k/cb
         mzb2mMr5h7J/H8gLXnZo+GlSPMcVE+B49O5hDGjbJSixcw7lmeCsgcSf2CPQ+dhqrR4D
         RKkQp990FsO4wlnaXfkdw1xcUnnRHp7wVqywWnxjaZU7TptUaIxtRdyydG/WMA7kD86C
         ttTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512471; x=1786117271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6LlL2aWIX7N9cP3QSxIY897bTTboUlJ4EFUK8JK0Pk=;
        b=awFph3e/ZLfIJqwlQO66VheDK7lUR1WhF4x1wr/M8qiscpVXt2hGD6OJQ59sioVWC8
         MNvmzDf/rd9xk/uYNjpCPpApLRniwp/04Kx9p0buvELXYfJ2mW2X0RF6Wgebmxr5CB3x
         uNXoHYHcQnFD03+TksY8BDyF26EXfbDGSIZ7Et+K1BR54SITaDe2pY7kgDVSWMXBOF64
         2t/FiwkF+MG0bFG/8JH+qzSzDQl/K3EZzSwEYQIoC3KmWseenWcgGgnVheqjZW3z6GOt
         Co99S5GhNAs6eqglpvmgyk4JQIsSwTGob6G6cZzNICltVHRVOle4mztGxoHHEsQi7Abv
         JfcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVXgMKLXgYra+4nGabQGpmUua3hebnqqPdSXCIPnhEXOvKeOFY/K6/uR/LcirJqBauEga2QeBBciWBZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIbjXzTekuCGT5ummGYnOhm2hAGsokMyOVvyN+Isb8b1FrKva
	24NpZW0AjmbGBcz7+Xar2HaaQ6x1TKyJu1XtlhIBnQbsIq5MW2GS6H7K2Gdar6MG7jtIIc6IFeZ
	fJbSKQjfeETtkoC0yO1ZxDWY3ZpaOimcv0YF+TdSK+//Xz+v+j6ac25hrUGY6aPWRZA==
X-Gm-Gg: AR+sD12t4Ph9LPkyHffchFeFK69DR/oxmC6mOMWC1f4Ia3C1+p1wSSM29TALEgEpFAd
	K6dAMPw646Ev/KatjQUvoz3S9hnnsolvscFV8aUWjegGa/FMeAk9l9SFAssLW7ULy6NsWZGjB0C
	Bj5LYUtcLuDJh9G5ogL6ElkputP6CI2oEXt9cd6fegfYV754uO7n8UxhY7SxvTEa+0t9DKcp9V8
	E4Sq5M9S4o57HrDLLIZ1DwZSA/+MEwVmm8SneBZbEHqM4AYwNd/qGb+Dt0/EayS8TCJZR3nG2nw
	DZkvmoMwl6aSCZCUM9XwZgt5nvkjoEchwmssXgsQ5tGp9I/LmHGpJjBsP8OSLgQRxGqkNbpNQG3
	Zp4IJ7jE7QExlP6ResC4QmQ+a
X-Received: by 2002:ac8:5a51:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52b5684f9a8mr7597311cf.5.1785512471018;
        Fri, 31 Jul 2026 08:41:11 -0700 (PDT)
X-Received: by 2002:ac8:5a51:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52b5684f9a8mr7596751cf.5.1785512470484;
        Fri, 31 Jul 2026 08:41:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44542ddsm218339866b.29.2026.07.31.08.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:41:09 -0700 (PDT)
Message-ID: <3ac4eb1b-348b-444a-bba0-e4c64d5b57bb@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 17:41:06 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
To: david@ixit.cz, Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
 <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6cc217 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=olqSXg431-K1-hY-Iw0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExOSBTYWx0ZWRfX+ItIcAgj0iqW
 bsj0G2LqgjM9A2Rff9hWgto5kxsNG3QwkOV9C2xeQMWgyD5h2QZbW/AA48ZIDkfW6jTxI42waAy
 yPEB8qJ0y9mFo2J66pH/7s1IpjgjOg0=
X-Proofpoint-ORIG-GUID: t__K8yVMRxiAWpHTZuwEfWZL7LEzNuae
X-Proofpoint-GUID: t__K8yVMRxiAWpHTZuwEfWZL7LEzNuae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExOSBTYWx0ZWRfX7KzMLKUJFzGl
 QD4MTUskFCenVDf7+8ohKT3FPDenMxc5fJ5wYfmPn69yISD30ioxJ1XTYfhSw8mlSiLRTUiXc9b
 t4N+bDfMfQpmcqy7ki77EkMtM7iy8IdhGd5SThKynYE4m1LYPWg0TH7ppos9dbd/8bM712Ff+mR
 957q13LNHCAHzVPPA80EV9afYP7wGczu5D8nzyG8kkocMJKHauCoBkK8ANYFQ1GMTorXapgfSyp
 1JNV9NQm3zAFB12K4gzHYRnDK1YS9jIkDm4Dex1T3FICswrkET2/LiJ4hhz9881yC4EIBWb4FUS
 19p4pbFapyev4rLGIbDqDO65Xq7UodH7P2aKVPRk++vsVIqrjCKqrgsxXAFXtvjAAXtoJ1wqIKW
 2y0CHV/v9m8ZpC01uqxcJj5itCyYfsQB7ozosN2AT0ZeJZVxUZSYVkoroEIFFACyOLfJNo5kRjp
 yWVuDkZqzTv6q1v/UUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310119

On 7/30/26 12:20 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
> actuator node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/* SGM2036-2.8YUDH4G/TR */
> +	cam_bus_2p8: regulator-cam-bus-2p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "cam_bus_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-enable-ramp-delay = <100>;
> +
> +		gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_bus_avdd_default_state>;
> +		pinctrl-1 = <&cam_bus_avdd_sleep_state>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vin-supply = <&vreg_bob>;
> +
> +		/*
> +		 * TODO: This node represent bus supply to the cam i2c module.
> +		 * Others DT do in similar fashion, but should be addressed
> +		 * by the bus-supply in the future
> +		 */

I can't quite parse the second sentence..

[...]

> +&cci_i2c0 {
> +	rear_camera_actuator: actuator@c {
> +		compatible = "dongwoon,dw9714v", "dongwoon,dw9714a", "dongwoon,dw9714";

1 a line would be neater

[...]

> +	cam_bus_avdd_default_state: cam-bus-avdd-default-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;

Other nodes have drive-strength first, then bias

> +	};
> +
> +	cam_bus_avdd_sleep_state: cam-bus-avdd-sleep-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;
> +		output-low;

Drop output-low, the regulator driver will set that

Konrad

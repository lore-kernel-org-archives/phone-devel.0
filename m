Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB03E0230
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139151; cv=none; b=ck9FNhTDJteB3KLDusB0lYAhSBcEuyKdinc3wfcXo84pqY8j+u5jAEGr9w8xtR6fOxBoEYqpBQIiZ+uik/njx5emNl7asD5yvStIl/5wNWcpMK6xaS9gC5iiERrSr/vMhY9MNt5qEiBpU9eaI5dKWmxHzje0ArWkmGRuSuw04Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139151; c=relaxed/simple;
	bh=/td6X5WjtjIuo7HLqlNXsVC07V0sFvtuTwzVhR5IWxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZXxmOWFTRJgAJ0b7HJUFwwbY/Z1mSTGwZGfV1RObCFptyB3bmxItE27nPnIIoWqzLLpK2zNTixYHuQjua3hWmfc6LmXSeDOiLbznwiwCN0N4p6gmK0AYdvSIWv2dFXvpV/KsVEqOL7hTrZN0ciN9STkQoORJopc62F6oxZTzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiWsb1i1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0J++iu5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiWsb1i1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0J++iu5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8P8Kw3202386
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGJhxOTW3VtIBueyJpZSAuUP5P7y+WiwLhN1MpOQJAk=; b=LiWsb1i1wLlS5KAW
	i1/Cf+5GJRX5Gmb91NpkDPaqOn8ciMhoBPIlOYYDlsSi+AbwnPXlyEljBphTstNG
	7p08ir4oJqXAFWjBrlCmdFbBbJCzWQicPTorUkyYd6o0zpSsdgv9yPFFDCgqB9+n
	aOaYcVblrMHCTP26MYAqWu0vyJT746W5radGoQVeabR2rLQ1xbQTIPomSxFAIXic
	CteYnMZQkNGeqcOcWET2XQqKcOYwmsrkWMbJ0pxC4q5P1IEuHPsdvxhgtv8nwJMj
	eLlYzbdevde2VBDAQlhoTeN4wDCqoUkTQzfewkC0nUi/izBz0dZYYu0xfWSho4Gz
	spsuFw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3avah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179fb39cb4so15286366d6.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139148; x=1792743948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGJhxOTW3VtIBueyJpZSAuUP5P7y+WiwLhN1MpOQJAk=;
        b=g0J++iu5OD/kfTZY+bDyfsm9imBALqLpJuShmJC4ufmKQBt5X2Vf6akh8Qfw+c8d53
         z73H/5fVLEGeQFgCfCB3ttfPGsiQbDKHLcVKulYvxDrugkvkD40Hh1cGIszaoQ45tFmE
         QkvG3innlnjc1yj2Q9rXOv/Ec5ooEeA6h/CgiVmir8VXessg4+mBlR8LHNPnINxRJdNi
         oxIo5nMb5NuymurLJ3a2HPECQGTpdtGn0v6lYoV8xi69e59qHCwuARlgPbFV4NL03H3P
         TgcM9K1wRH5q7wNVlF/5PnuJbVjz4Zq4RuwAmJhr/LBGyrY3zR3fAJVUPPTQMlpiqFs6
         SzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139148; x=1792743948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGJhxOTW3VtIBueyJpZSAuUP5P7y+WiwLhN1MpOQJAk=;
        b=rt8GJtOYFMEtY1waxJ4DgWKJ2N33w/8RHwdC9/lPiyd4Seu7TDil2bOZns7uB5pgC/
         KFc90YnY54PaDkmw8pYUbIsfVPFfU1NbbLZ4sJr1lDrspAWGdQ5K6SJ8Rq4n45n8fCZ+
         yONHTOyL2JwD6t2tjX1TPVEU4+xXuQH4xtovNeum9js2X34M2ldb/IZXQm0azK4Oc5tZ
         msYWtWvThZiGflGodemenQjhTS11FjQQVb8gienxP2kUB9smFM6+gGmKOKT9Cyzf2G1D
         Z+xv0LkqKBABSgWc/Ko79oWgtyrn0mGj4ySIfNOg7lif1q5KRcXD4ZVZi2crsaDsiKtt
         XvYw==
X-Forwarded-Encrypted: i=1; AKwUvBxvaKdeRIz7O6cUmF0gpB4RzIqmcSYrn61jtff9mxomHfrougInx5f9qKWx+zD+VfVbvV/XKJH3g93UcQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJb6GXCs2wHjXIIflKSZHPho0vKGpnleOjwGJDiCsG0dsKk0NDf
	BWwhSOgXokGUP0FftBUZSQmgze5U2VusnxsfGxI/emfbYiCmO+E7JyKqWiQZkUSL8z5g4hvdyBR
	Yc10F0yzOIHBK9zLItPKxEiZH/ze5Q6a4/ZCRUrpD2GVJsVY8mbawdQspqQDOijvxcQ==
X-Gm-Gg: AYBFou0OENKXX08e2M0OHM0LWbzTySy47Ndf52Z4OaOBZnTm7suLi9vxK9X10IRX4om
	8w2HP9rfdu5l0Xd0Hd1HIfvKIq5Xrp72AeNL4xWB3kbsMz1WD3xqI5I06rM+OADcUVndaDHKGie
	UGawZX5rcmRzgfp4ucW9WfN+H28TC3ppwZCR6CivZdb6cyPImxV29R075A+u5hj5xy3uf1UQA8Q
	CDOha8bO5WiN0A9LtizTcny5jK1Jp4kU7r1qGrgkQ+yiH/R/LytoFOBLdidGhTd2CTzIUb+Dzjv
	0JjrKwKaFezFwjJw7L9AinL7RoAk9HoKIKMIU6oKEn+hheuZrzOW4M8errxuOObFOC1sviB4CzA
	SqiUmQ2dC3f0xf6qietF/xA==
X-Received: by 2002:a05:620a:462c:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f1eb089dbmr140462585a.1.1792139147678;
        Fri, 16 Oct 2026 01:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f1eb089dbmr140460385a.1.1792139147241;
        Fri, 16 Oct 2026 01:25:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a132d45sm641339a12.4.2026.10.16.01.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:25:45 -0700 (PDT)
Message-ID: <3912a8d7-6e77-4287-a3e3-84e726f7205c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:25:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfXyohTeB4RnQuY
 Q8Ha1OQWdnN3Zs4IvME0gPO7WL9b77/1j/cEP47MbucI+qDMduJYD7B82+LaQnXaZ5/Uaeg0IWg
 NByIL5q18v5rpSWUegfblPxtM2vL8xsz2uWi8Hgary47MjqLMRogFlB7KTxNd+7jaUevZugRW0e
 uk2WGYnpYsGYWoSq1x7NgGg3w0TwSduhXZcqUkDz8aXcvkikKuz9M57pozHcC0EcpbaSA3cWNd9
 3ePTHZhMaimO+m0rAFTq4DTKWeUFel0Nn2bn6DBjREZ9zLtCbpT/XhXQagk2zYU6YcpjYwDRZyy
 YtXzWCg6BUEGYM+JP4zEcczOkb4P7iJw4lArP2vKJGRy03ZbdhFghLBPKw0Q1zZd3XVPzjscQBk
 SpPTAis9072Tld547k1QUqKZUWKasJz964RUWD2V+j7unkHmxZVgqYtVVDJVEjUkq02/vSVQhQZ
 S8NFUSAPsyHtkW2s3Cw==
X-Proofpoint-GUID: UA856HZPEx7FI7A3JBRh_uhza62UGgNA
X-Proofpoint-ORIG-GUID: UA856HZPEx7FI7A3JBRh_uhza62UGgNA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX3+Afp38qvFot
 bgIoJHxjOrULnY/ttlnRty/ngNpET1VtU4pCLuhk6w8BULAlqjApl9qg2bEH9KcQF0rx0glqs2L
 OQPowDJogjULuC8S1IelOqJABZs0mnM=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1df8c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=WE8o4AYwAAAA:8 a=pGLkceISAAAA:8 a=tQcTOJXxbJJ62TXxOOkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160033

On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
> This file contains common properties shared by all OnePlus devices using
> the Qualcomm sm8250 chipset.
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> ---

[...]

> +/*
> + * Delete following upstream (sm8250.dtsi) reserved
> + * memory mappings which are different on this device.
> + */
> +/delete-node/ &removed_mem;
> +/delete-node/ &camera_mem;
> +/delete-node/ &wlan_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &gpu_mem;
> +/delete-node/ &npu_mem;
> +/delete-node/ &video_mem;
> +/delete-node/ &cvp_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &cdsp_secure_heap;

Let's sort this list

> +
> +/ {
> +	chassis-type = "handset";
> +	qcom,msm-id = <QCOM_ID_SM8250 0x10000>,

You can drop this first entry, it's for SM8250v1, which is a prototype revision

> +		      <QCOM_ID_SM8250 0x20001>;
> +	qcom,board-id = <QCOM_BOARD_ID_MTP 0x0>,
> +			<0x0 0x0>;

Likewise you should be able to drop the second 0/0 entry as it shouldn't be
meaningful

[...]

> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n &vol_down_n>;

property-n
property-names, please

also <&vol_up_n &vol_down_n> -> <&vol_up_n>, <&vol_down_l>;

> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		key-vol-down {

Let's keep the nodes sorted by their node names

[...]


> +		ramoops: ramoops@b0000000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xb0000000 0x0 0x400000>;
> +			record-size = <0x40000>;
> +			console-size = <0x40000>;
> +			ftrace-size =  <0x40000>;
> +			pmsg-size = <0x200000>;
> +			ecc-size = <0x0>;

The zero is the default, you can drop it


[...]

> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <40 4>;

Do we know what these are connected to? Usually it'd be the fingerprint
scanner and NFC eSE

Konrad

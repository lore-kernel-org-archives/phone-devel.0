Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5697A3A9636
	for <phone-devel@vger.kernel.org>; Tue, 12 May 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580110; cv=none; b=bri/bmxbWdzxZTPhHQKMipw0aPsjfmyrvmBuq4dvKdV4HdqoaSDX+udGaI+tnglz+25Da8L50qt4M7hy7j1OmgUhwEs7D55Q/noOHXvCqT6OASgQiZSAW40no2tVufbpS3X/Vo/LgBIQCpsPQ2sqaFG9QM9KrZr559xs1+ap0bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580110; c=relaxed/simple;
	bh=M4MGfksm2KJNKz2SopLwjPKXAvHbsbcD2AS/jpfC2rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feQZmc9lrH5AI8frvBecXeB91Oz94oxMa2iRBjNrYb0Sq7/8IwJuQYbq937rA55dzObSQUbNIznzRBlPRcBcqIiVrh8u9Ie+H10OmD+sZv5K1cMmlPWWLPdTMXKmTOuXsP5q6J3InBS/CJDD72y4oMPF78sHbY7AKSdIk4hJTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kR7zxMTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S71nK84u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kR7zxMTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S71nK84u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C55Pqg2994871
	for <phone-devel@vger.kernel.org>; Tue, 12 May 2026 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=; b=kR7zxMTPFYJQouA3
	p4DGnZeq2/EBw6uokAjZBrAa5nUZ6Mi3Kv3DQrbc59yc7W7qZ4HZ+xZTVUMxsk1B
	oEoyy+azEPCOx78k/Yp2Nmoq30gk4JODkltXyltyrjUBQc1KYMvX1Jn0vcIj0dBu
	YG0FcxAIskVG4+AFcERwbuBaHJquZZZHCjBy00e001lhkdi8S2Exg+fDXqsG4mOu
	NdI5ySOTUP8Y5lImAiYmg950I/HDfab+vSkp7YeTe987hItDG5goSgJ59DrHM04k
	sKW/eiufLRj1UKFwNsXbpVUt2hG76jfY2FZSPgCKA15m9NI9/MZh4UHzQvI8dv3Q
	QrriaA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0tmyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 12 May 2026 10:01:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so374440137.3
        for <phone-devel@vger.kernel.org>; Tue, 12 May 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778580106; x=1779184906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=S71nK84uxIthK45lfq2uYXeWbKd0tbFtDvgDLJR/NmwyQE0mZbW3zZ/QcVAbx8/GE1
         Z6A0hQyzos05az/8KbGEy9DAbdUWcjeWMk5bmyUzD8+trvZEZMlhdmseSu2bu3G2jovc
         oWmnBCmVxhffgpgqbnlMyTSR46oQYvEHYKbQkiW7JexbvgaqBWk8Gen95+HxYizmTna+
         oGFbQCFCOyFlPeaM5tRQMVNZekLiL37WPlS2LAvmR4YtUdtwlZH0bTH8OlBTI2QOmh52
         IOjqeYL35So39JKOec15xzKwwxvTmpLD9giJEaGcfnmKiNL2MLXGDHk/3RaSONXbQhQd
         A5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580106; x=1779184906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=hns2wmJkNHWJnMpxzZyFFId2P8Y6dCUCAwIBtvKd2FOl5ZU51XyExkM6rIkI7RnRCZ
         G04cjk6JQJLbEc1bSvVG0fL85zqoa+FSyKz/cM4gRnLS7jSAvIrc4XWNAsPMIddGciC5
         pz+EKzgXnRnTWrFUGHKCHjJJ0NsbxjIG6kfYjV1h6n+Y5iiRW5FpHHNXKIcnsvAO/B5K
         ErqlUlVaUXY6mqdsCYZJ1o4ODoRh+czrXnSprCAjs7IoZIGd88B8TEuqPEGtjJuqre4D
         wlJzqqQ/ANSl2Fe8Ea2Y6ZsEgalnlcvBEHiiZqmlv1Sa47oXZVhm/qSFLSl2dLjDzQps
         YP3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+uJWBCx/D0N3h9Hfr7UIoio+jMoB5CEc+bn8LkcOgWb2Apb1ech7KNqpNvq7/CAHzQ1J+1Ud9rQ07vgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjoPKX9DQnBfhk+Ab33NrH3PKQSATZbOS4AbKa8GPxUgxlR69p
	t/qqPTEuh27Vrei9Pi2imJ02kFG91LLEULNZrrpTn/Rsz5vNzAWRiaVXzwuxOodM42a/apz2pyM
	J3bTxRNJgq0MKcgPs2p8+er1FB8NBms87P+j3nwY9F/2DSjIf/EIkpk3/ndlG3utBww==
X-Gm-Gg: Acq92OGYEUDcsHtRpck2W1cuP7Iz8IaCZfyIfN4Jf2uoQyFtkUOKHLipcfdbbAqMDTC
	cOcm3A6ZTqpHDdsuILEwai6ffYJRQ+2H3x9UaRZqPfW3xfROS9G8GVH1vs62WmLIfATkENv+fpn
	atnOmWCTZ3d55FRnZGNbEvZ78ui8SBwOATQrESPXsvJaSsJfwfyHPlQyFIRZLL6m2gR7Dygqkra
	fyYD9DHuWohpSMNRFrPuhRu9yE5znH7uD0kkcMYL5x2D6bNupB1+w3B8oC8BkJfUOI3RzyXhglL
	LM2L+OSIEgtg97EWr1fLS+FKF1xnub7pgGUdUtV2awbVkO/NyS3+x4FnG1FfyzCPbYob1+mJO0N
	HpPz0++RKu6OoaVUDf29u3nV7CEMCHb0Js/ywOr9BSEaP4bphFQjIx8L1qEaK/NNRMX/0RNpV47
	pJjkU=
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781347e0c.1.1778580105603;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781318e0c.1.1778580105090;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc57c12799sm492515666b.47.2026.05.12.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:01:44 -0700 (PDT)
Message-ID: <08d1fd7a-c782-4d8b-85ee-1b46868db343@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:01:40 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
 <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02fa8a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=alOFDL0nBBd-F9mXlB8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 3f52u446axmoLA1S-KnOWMbGX59_893H
X-Proofpoint-ORIG-GUID: 3f52u446axmoLA1S-KnOWMbGX59_893H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwMSBTYWx0ZWRfX6wADDCVMmXO1
 lRL3ndhGqNiWyIqLrr0dyQqFDIUs0/zcJh5mQEOTTaSjILl5yXH/dUVVgSSJC27GnlNlef7f6LU
 3HurlXZUgisPislzyLY+EnfZcpMee9iHUdekWRmvlvCsy4ZolrglS7WVFb+lTFVzOfc53xq2Dfi
 G4ZaOMqqdTJawcT12FUecy7DkoY4dJhVizxiAS8MSRfBuQKzgAWRfyTluC6Qrr3SaVXANC2lAY9
 6+pYJYiWCtTzrWI6ZLSP9vEjWSyr+co+4AhIDX28UvESqs1vBQm5Z09W/5pMOzFlYJTrvOvDGDR
 FjfoyWbFk7/3HcRGDnz4KXZjEWmEZGr8UqIJ6jiyrqA+tC3bL8Qc9WxhjuTkTsaeayQDzUjAs/i
 N7hJnTY2ZE4rDhQB7UrJNb36Z7PS+SShFM+qKj9D5ZIlbdND4/HY/vvGdj99NUNsphBM5sDLL0P
 gbE+SxEQ6H8w9SQAcPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120101

On 5/10/26 11:47 AM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to pass their control to hardware.
> 
> Venus core clock cannot be enabled if Venus core GDSCs are switched off.

The downstream device tree suggests the reverse - the venus_coreN GDSCs
refer to venus0_coreN_vcodec0_clk (and venus_gdsc lists
clk_gcc_venus0_axi_clk and clk_gcc_venus0_vcodec0_clk)

> But since they are set to be hardware controlled, they can be switched
> off at any moment. Vote for the Venus core clock to enable it later when
> GDSCs get turned on.

I understand these words but I can't see how they reflect the change

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 45193b3d714b..420997b00ae0 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  	.halt_reg = 0x4c02c,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c02c,
>  		.enable_mask = BIT(0),
> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>  	.halt_reg = 0x4c034,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c034,
>  		.enable_mask = BIT(0),
> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>  	.pd = {
>  		.name = "venus_core0",
>  	},
> +	.flags = HW_CTRL,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>  	.pd = {
>  		.name = "venus_core1",
>  	},
> +	.flags = HW_CTRL,

This should be HW_CTRL_TRIGGER, paired with a change to call
dev_pm_genpd_set_hwmode() in the driver - this currently only happens
in vcodec_control_v4().

Konrad

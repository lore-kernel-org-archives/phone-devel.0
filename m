Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB727CCD3
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862074; cv=none; b=rIpcTbDUbMeKnhRaop2ShWIPbBu95BMDrbOtenutJFRManqzc8mSuzoiS/79TQsXeGY4HzpW06QxeQ3kbzyUbG8S2tp5i34kPnI70yMYrWE6xu/ZJgRwZo6Ifbgh2N186DhyaS070XFiA0HBPJplpEuSTAjJygsiAH5Ahw5pJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862074; c=relaxed/simple;
	bh=pggrvf7aFM1Uie3ksCGKm9fcXTwphOeBmE6ZXg1K0To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0sU0JctN4tHv9sPeiYf8n8/QeCvH5+RdseF+BEi43/Xqs6tp0vtdbdhTc7ETBeKXB4OF/TGmKVOTXi5z5LPotg/OE0kYbJCgHahGGdtqVOrsRXkBjh3R/m73VXwZYYEP2fFYMEMnpZ7y4xCaev3We6lxdr5lhdK7Ed8cAyX4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEoqa4Kp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEoqa4Kp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SABlGO006431
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIwMyfbj3XbF1DLrNX2RoNpDxP/RC9hpdQ0dRJ0tGHQ=; b=FEoqa4KpYEQI4H6K
	NXfIgOYAc4Ss1wTxwsndXJxOsYo3vCXJXXsgFoY2dIwqxww589YLVG8IY43hkRwy
	cspwMlDguhNhCS9XeOQAOes3etHs23ohcgIW1JfWuSjpFi8jEMUDop7t+NgPYdf4
	y/GmzHxTMP5cC0Na7yKdv/05FvmK/gRxkcOKCnPEpjzf5eppcxloL+MvU9misz86
	MKOxOqsPJMtqrNw95CBB+1SfYJTfQVxJ3MhDqDN233nNzpJNTK05lKG7ua92+SHn
	/8O/XYXbQjytgkftSoEW6FK9tsKrbp9TA/UIpNPieH2gNUxDK85mrOxBcunC4KXt
	9dHK+g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqj4rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:41:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7375e2642b4so3578927b3a.2
        for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 10:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862070; x=1746466870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIwMyfbj3XbF1DLrNX2RoNpDxP/RC9hpdQ0dRJ0tGHQ=;
        b=BCDeiuRTfcUPuI3myIqsDodzFaq35NPdmYRpzhGKtq+qxRlTyUd1EUaR7aZaRRQb4C
         wc6LfrKG7c0EMmu6n0g4JoYob2Of+K102ALkZaS62aSNWoZ8FRBhiSMPslB9FOchV1RN
         TK0/NrkMxMOGL3ETTSW96djdVGqloq9florsvp+2Ld6QA5VtxJT9x3HvqQnbna4dLcRs
         pyZGbcWitvAb+TMNonzM1Eio9SHdoVBlF2IC5JJIM3FrENkX/O82/WjGOpOTTLs8Y4Zn
         n4oeAJwC5XJ+Fcmdd8GmMgQaEZPzhTCSwjZ23+O7CtcElaV+NqaW+aSfU4uKbPX1VaUQ
         FpnA==
X-Forwarded-Encrypted: i=1; AJvYcCX4yopdLBgIMLBA93qBLVZElYhs7aKDRNdB446aSmS/h7tg0Z9p8+5DxlMaYtTWsGOIU4cTGLftm0abZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC17XdBvfuGegIgpyZr8Ru0SqM2y7isCv2J2Vn/CyqoGSoa1q/
	W6rige4V/NpQ1AIY8sMyJnjiKt8mgaV8TI+Qfg/PXBRIjPp5WoZnZWitDo3XeHVa4NwJ2ejeVZY
	RBkG28EPEsKtQrPZrtaQIA+YnnnEm6MABGV0CJSZ3GORljyrdFjd6sVQKpS6Mkw==
X-Gm-Gg: ASbGncvOYO9gI1rXJLgmHVAxaUm2TlNvs6g3Lixgz/086fU0LoMrXe4zTR4jjH8aFuI
	P9EPEXC3TPs3u+W4T3QPyUJPs59zAA+i12TThzMZDVfeVehunVYqAZVXMzZye6BjIn0MFi9qQ3j
	yhVtzTeU+3PlZB44qHTzQJl/N3Cpa1YhgiW/BnZYPkAOUsAJ1zolhADF5U6exBuDzNUvdg6inJF
	s1GPI5ocz0P3SbB6kCn5XXLgS3oI6IEwBahxcqtxYynIJtz5eX0Y18kYCenoVFbbmzt2RhzTixK
	FUn4xMJBBO0Qa0y9frx1/JNKbRX+axZx0Tw6CANa
X-Received: by 2002:a05:6a00:88f:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73fd75c4ea4mr15399453b3a.11.1745862070590;
        Mon, 28 Apr 2025 10:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgjfMkBn0pV9r4Qg3qhNII5Usb8joBTmFadTYCHZoBgt9OiIPYvsOPn9WNpttYgRk3jvRtAA==
X-Received: by 2002:a05:6a00:88f:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73fd75c4ea4mr15399426b3a.11.1745862070246;
        Mon, 28 Apr 2025 10:41:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25942157sm8304691b3a.72.2025.04.28.10.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:41:10 -0700 (PDT)
Message-ID: <c1b23184-396b-4c6f-a890-9e08bf564eec@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:11:05 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gpucc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-4-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-4-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MyBTYWx0ZWRfX/YwCeiCk4soj o0eLALUqQlEZ6kCLx2cmwVa6/L+KZdJKbqAL2+v8IA46086g7vCocARaYgmDAoZdMu37iJLQVBv zV3W5xcubGkE4bE469q/I6VL5CzcInVGB+3EKjFciSifCBEidUpsG14NaZuP1etx/OplZY5QX4+
 YgpxEp9bbwow9OX9POKMEcaCKmQWElYCYy+9Dhx7w3C9q9XDoLVKXivclMKAFqrC4Y7afQeh8fm PdHfCul3G0MHiaQPb5z+36201i3muFN5dfcdv37wEaFWv9jy92zpKOaUhE80bzcJDIy35b0OQWv rPmD8DugxZF0KpHcDhlEOkaXr/tSUqtJe38/IWVAyzvoJKWCawn2PLl9uJapzxiHaB7DP4d3E9L
 XKuP5HvS650aeCsYpQxbSZYKaGWANYr+U6dijbL2xsPlBMktQsqeOg/JULFahfKjKvMIOg0H
X-Proofpoint-GUID: UJIb4q9LdbrW9VIgDsD2T9cRYZLE2ung
X-Proofpoint-ORIG-GUID: UJIb4q9LdbrW9VIgDsD2T9cRYZLE2ung
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680fbdb7 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=6dQnf3u2Ryt8jKbU0REA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280143



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used, with the exception of
> gpu_cx_gdsc which has an explicit value (qcom,clk-dis-wait-val = <8>).
> 
> Fixes: 013804a727a0 ("clk: qcom: Add GPU clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/gpucc-sm6350.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
> index 35ed0500bc59319f9659aef81031b34d29fc06a4..ee89c42413f885f21f1470b1f7887d052e52a75e 100644
> --- a/drivers/clk/qcom/gpucc-sm6350.c
> +++ b/drivers/clk/qcom/gpucc-sm6350.c
> @@ -413,6 +413,9 @@ static struct clk_branch gpu_cc_gx_vsense_clk = {
>  static struct gdsc gpu_cx_gdsc = {
>  	.gdscr = 0x106c,
>  	.gds_hw_ctrl = 0x1540,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x8,
>  	.pd = {
>  		.name = "gpu_cx_gdsc",
>  	},
> @@ -423,6 +426,9 @@ static struct gdsc gpu_cx_gdsc = {
>  static struct gdsc gpu_gx_gdsc = {
>  	.gdscr = 0x100c,
>  	.clamp_io_ctrl = 0x1508,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x2,
>  	.pd = {
>  		.name = "gpu_gx_gdsc",
>  		.power_on = gdsc_gx_do_nothing_enable,
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377C37CD2C
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349320; cv=none; b=SU3hQMlZPrX0+MKwv1A8iKVtddUiBWjcZZBfBZ88eIjdyQkvpQb23Oj9oMycdQKs/mwunWScdbXQ61PLEctY4P+/ERycmdYl9HYcOjLADV5If4AQltlfEy8tO0WwJUuDBY8gOtAr9tT729JpM7w/9PK0ui2+/BqYjNMiaOT/N8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349320; c=relaxed/simple;
	bh=lL4bCSw68GqewS1SJ9/DkQuLrzIpX5hWINWoB6HXivk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3/XyTEH7bEUPN5KlwvVwN75YS4qt4o59GXc4nD8552P0y/3/alGjXT7bLYQPSwEZAcQMdskNibcnSXu5/i8Moaagz0jK1/K/hkN4eD2O3izkNWvGWPKKHWXo8hxa5wH9GffQElbkJk2gEsY2TBfrcN1k0t21nnqV6bnJb5f174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTx/fR+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESo2QFNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTx/fR+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESo2QFNa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9i3Po3170748
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=; b=TTx/fR+8Fw4oIrwy
	XTzytTc1BlGCrKqWiVuo7RMKYj7UOYWjwbUJwkT/8OHGc5unsOKEMY2fQB4rP6dY
	uTN9v9eIGAtx1DI9s3pp8SQkVmayI+TUeL+7DwstIqKoXdZCsFQfYj2frgQOxku0
	oUyO/5tTffMf9zbx+neyKrKMgJ/Z8aggiIPwcOOgKf2BgILOt8LI83CcOCLTReNo
	WVIPuU0ORHodmM9LJ5KqK76Hp4EYUW52VGZSjAwx/V2CKM0bvKkgo173GW8dVvtu
	PZ963vxb9ozdsGhhzwVpvGAyNnEPlMqJPE/LJC0RJx8yLe/W6SZ8t0CDjf4IyWyC
	HDeHRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r24abu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b68af943eso8029891cf.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349317; x=1774954117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=;
        b=ESo2QFNauC/AegNNfTmL7SSBZWCUYvSWSFWVm/sY+nNvwgtNeQ/IQ6Vnn2/uQnNBQf
         1TnU3xVBe+fOCieyhfQsnoWY3lgYRLcA3ib3vgEbU/Bqaxh4DZhIBKEtZRY0vrccQZNL
         7dNdHHF09q6kFIxbIsVisZjWFAgMc5XyKKK56l/hdEXeBDDgTZSl6IZoN6aGoESoZQEa
         pxWXepC6pGM3ECntMJgoMAyjDw1BmWDtavCjRHt4y7gX2Apt8TGQav9icgo65ACULuo3
         d2PtzBiaFIGH4hs+gchyBuv4E07VfF/ZEhvzd+EHcvkcVQDHQcZBGNnxi2A3fm4CpIbH
         5SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349317; x=1774954117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=;
        b=ejmxEHU8MyBZEze4n4Ql65Ur9XP7YiXKtDxrWVFkuhUKyXXwPw9M3wBlP9Zvh2USGF
         IEtOJYpMLfqBsdii3YtbXNLCtLDg9frm0zjSsGgzeFcBzyHT49Z+wCTTP6nwtE6gH7RM
         X4S6WOqO3KcrqAHo1HSOmM+Pi6AkJOoFnDL1Q7HI4tVwt/8Rjn1nN6O3dO88ZkXEGKBW
         PMT4DUWKX7bUPJAegIck4rR+IJiU9oeO/8tUbQu/OJl0EEgG4s+32FudYyd2gTKd56KN
         WpjgyNMplz3t+4PJhvUomXBD0haxUCOsyInvHCUICTIq19d4palBjaUgaSXO/hj3kuNa
         TWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy7PrviQvX9Ahigg34xupfIkQtU2M6B39yB2+9wvp/xwBFHzUCQHJipoBRKIw/ZfO2UlfZsbA4+upSsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZ5ubJIq0eR7KtbawASsh1xfPdwD3WlOR0unB7JvsBiUbKmNu
	2Zw3vH+B1adYXKJ8gveSB5oIYkBNvVFwpkKluFVnoUTmc80jCZkb4kkF9XH+GiIb++AR4ML/ydr
	2a4tstMENK7drsttGd3uM5dS4q1gHu2jWcUJ/mPrzFnNL9Yh0gLgnhqhjHoJAV/qyNQ==
X-Gm-Gg: ATEYQzwdfqvkfr8V8LRDfWQitW585b4s+gHD0DlpCW9BblOt+9FSNtDplVZUdfFs4Tg
	JCEHm17g5SA73DajE3ZWTnhbiYuNgVlicSLoxZ1/apAG8e3n2YetGjQaStve1HFInPwA1q76HpJ
	CGW1htEHAbsxcZZ9melvXGG/qKlGpEffHGrGhdInhV3cZlKfvzSwMzB9o716qwwhCo863EsBx+p
	mfXLlre7xdCImV8W2w9y8vLBqZX8N3t+l3+3vEnn+MNeu7AzfN9TVGy8O997CmBlRwV424Iowy0
	X6SgwzOA0oCggmz41k4T+JbkM51Wh2X8+YuvcgiVJKoUkFA3fBvbALdi6Lg8lIPPPjL0BkZjnDd
	tUJktHKHIm/TzkP80MGD8gziAlED61ufqH90MNVnGMHKfb5BEZHYmjs74T6rFdOpPFMXwCbRW0w
	Zlwys=
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175482371cf.8.1774349317478;
        Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175482181cf.8.1774349317073;
        Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm640162866b.4.2026.03.24.03.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:48:35 -0700 (PDT)
Message-ID: <05d8f1ba-25a0-4fa7-8b63-d07c52d2676e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:48:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c26c06 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Gbw9aFdXAAAA:8 a=zP3sOliNIdXZDfanJcgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: qIE1ai7G1vp1bsl_Q-hnDiXeqxVcUmSV
X-Proofpoint-ORIG-GUID: qIE1ai7G1vp1bsl_Q-hnDiXeqxVcUmSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfXxgSOIPPfzept
 TDpMMP+f1cT+GaaaBDeUu/ib7hXS3MRbfa0jaBBJ9i4DARqq+9sy3tORijrX4NpMXjzmalIWhKq
 0gbx+bBXnESKo/OWYmv4iTH1xTM680VhDvdfsMCYnxq+hkuM9JS5omaVhtjbhJKO0emP8obvjTI
 3NClE0uxuldrnA3gpkbD4Pszr7/LwIuq/Op2Pctxaz+e7+Zs74+pPs9sDtCh5u1yjRgu9nJ7gkY
 5YQ1kSW/jnxoB/4f57Yv5Cj9pZv861VqZ/l5tIFfkBwHUcc0/G0pxgk6x8xJflPLeSfLRUIaFBS
 1KnwvPesd8t176YixmmwfhwoN41TYkfl2KvIOrJvB1+r1yYGWRb/LI6hH2j0qlRODa0D7NPCyA3
 MNoqdJjW8qzcEMpjLEhzUD8/I3eNGy2QOEIBOzsPX2DgIEyN3ae9QZgpf2+Ht6rHm6Wl2kOrMiA
 0ITjCWt4yaxoo+6zWIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086

On 3/24/26 3:06 AM, Paul Sajna wrote:
> Qualcomm video en/de-coder
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 93ed8f240461..87ac41ec2e46 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -580,3 +580,7 @@ &usb_1_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&venus {
> +	status = "okay";

This patch isn't useful without patch 9

Konrad

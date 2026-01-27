Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D42C0F90
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519188; cv=none; b=ZvguPxRM3AKsk5+cYtqSeFYpJ9rznPDzP8qNsxcT3CfPZNrfuySOoWmMaGttDZDFwEdZuYp6G5ZvHpLp8mGh6jJQMNVLpX7iClJfU71gL5BOXxev3bMWCTsSLAyWIAfiWMWy0/UR6dqPpjxekpbk1lcPOikBi4xExvVa7hkkFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519188; c=relaxed/simple;
	bh=jgA/Uujf10BhGbOSNIE1krgPvsTZ8w0jjl4lzAXYgUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxtnXpxcrKvgPiQH55cLXCXWfP7RKqxIoEkHOYZllo3XwrneET2JM+BQWtAp1rV599HApaJWQYDThWJJ+y3YtgZXxd2rJtcR7H9W+E//m2NL+ruLskpwmweLU7eEbmB+CjfsphFkJ6vnSZh9ZSS53x78JAlYOpePiAgaFz18jbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDVdB0Y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlFGzprW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDVdB0Y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlFGzprW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBwawm1135805
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=; b=YDVdB0Y+tXBhgd7a
	VPs+WZnJhyirwInsxyHT7uC79jySmwLuVgDU5pD2HFTE/YnLwOYTrlqvywJ3y9dM
	nDVX+VnsF++5AR927VsHANK+o17lhrJ8C6cCLowMix4tKmGryfAEEhiQZVBDaut3
	VD84J2XJUujWy7+OhMKzmvoyBBQTgEMMcvxFahxUS3F5LRDzaeRKhWfvdkePb6GE
	sD7z/xUqIkq1JR+gStvuCJN1TB9EgUbmFqsE4C+d7dcIk91/z/sJqWEb3yhvoirw
	Lw5+ENRIpzDzSVEAkL/IoFFQaOJX+5J4iFGQg4QrKvzS0fiQHjiK2LyptKDVKEvv
	cttsRw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegwgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 13:06:23 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94800e7e6b4so1319503241.2
        for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 05:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519183; x=1770123983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=;
        b=YlFGzprWFb0FYvvteAmH5YHShrWoVQCmTLdfrPnmji3bsogQST6PHMIWlXcyX77Qc+
         /GXTK22CxYC4Zdqr2SSq2r8eVKdWZWvi3QQZeXnUFDTHRKzAEi9Y5wYewrP42gkbdn9e
         4PQyyIUHT/1sN0lG0v4U/I0JywCFFECjJQSxAabk4PG3Opi8HSVPJnygFcrNumBWO7cQ
         MnL0CM/3pqeGPm+2nMrYe97hrx97Ik63NYv6L92z9tDfQUnWXf2tNlDz4VLQ1JapnSnw
         dCGwNuObCBwhNhsoufkSGcuc+ozV30TlRqs3hvila/HFHovEQog+KsjYISkXMK1CTYaR
         SuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519183; x=1770123983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=;
        b=GKcodibwoltOtbtgWUjrrZ/tBMDYEHuObV81ELVU0uw4VItbknKXU/i7f62TPEQgJH
         ww9Wh6bgd8faFw+8p8CaOHw05gmqvRKTbC8I9924Z+V6TG7WKExYFnibuL5uUjpC916E
         1yHD4XW6GCgFXgpoC9YlaIxrkN8DJvbiJf2UDfScJ+PUn7k3L/d/e78G4AK4kcxp36NS
         tiQf1ZXJCRmLU0ESwJXA+oijGcQrCbj+C6PpEcnyjnW0ilwKX1QHwzCFGx2mOuZfRKBL
         tVed+HA/LFJi8zpKoiH/M3Tuq6QRm4zvuKS9u8Lxx/Zf5F08GTMc5kWys1ssX3HO2Gz1
         jtsg==
X-Forwarded-Encrypted: i=1; AJvYcCUGL1RZiNNfhv9exm7/lFDfUM+0xJjq/Vvg+npympD8ajpOdZdcZO7nQlF8VmY94oe+gOhuD4OYTR+jyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIlKiQQ8U/iS4qo/1MywjBTVqXc+8Bi0SoYpDDfBltbYWnESTg
	ZXjMrObLe/ZWMY1/D4uIUNQ4HJWSQXb0VcGgz30T5O/4+Bx1bxPiKRmHTPpYrkM1hdMW37qnUCh
	ziCutUTn+ZAV/JxJejZgTJ1Lb4/3zpXD9uqhIz9p4mP61wY6mkmVhF7bW8kE3ccbzVg==
X-Gm-Gg: AZuq6aJry5yrXdIe/9ZqmLsbn28MmqiOjIqMTIUzYaIGBNoxkHodKFt3SWXB4UYmZke
	LFlZizBQBetftgKgsQ5CdwW7gtqTrUxu877ycQ5p76IiLkC+ZFDTmhIOyKta5QQwRWIDlK/NRLC
	bcTQ550Q2KirWdqqVyvHZxXFQkeADVV0G8WXh4Qnu1G0ovRqgupmcKNsk81S2QVvcqy5jZT8mIM
	7UlwTG10KFHqaWwCOsb3c2rEFFXtxCRcKBVOm8tXuhbrzXWLfGUYL0BWhPKsvOivP7ll71BX8ZC
	VE+03xbfPwmvkh40v3RMIfmU01Jd5rHbdKM9fVJGabDjNJPkpb0w7BGNe1buHP8CM3NyGsAWJtF
	HZFZk6bKPaOZsGi5r7PjoJfSUQQwEaPu9Al8hV6xb2fzGKGlOmnFMGkGCt1kCCEzaJX8=
X-Received: by 2002:a05:6122:91d:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5667935b4cdmr288165e0c.0.1769519181373;
        Tue, 27 Jan 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6122:91d:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5667935b4cdmr288151e0c.0.1769519180836;
        Tue, 27 Jan 2026 05:06:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b98asm6147030a12.19.2026.01.27.05.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:06:19 -0800 (PST)
Message-ID: <6498dc50-c08a-4416-95ff-06a8ca7db6b0@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:06:15 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260126235018.969140-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126235018.969140-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNyBTYWx0ZWRfX+JEZH8jGkoSg
 LxqvIpsubOaJlJq9w5qvNa47QlYOXGrOr3cn4eNilkHufn8Z5QP+f1U9mSL3nrlVxnHE33t+EsO
 gGSygQ0WvrMVFvpq+JhpSrB6BO4vMco5uHb50dydFaDc2dM/xCoBIf16qt5XanmvUZMXuNZiD+e
 7zb3tjZcsQ97872+d8O//7imW26CGoFgxVR/R1Br8XcQ4u+jRB6TAMCzpoCumZkF8sGrqZDrXVu
 TMaNcP+8QtSBl7o7S+zOoUOvaGbnKHO9hwiEkHdPY/rPZPWm4qNHGI6eW8dJMY2V68Qwg3YV8BU
 VKczCbTpn0I1KHHPX49JN2X7ESyOXtBywODPyG6PSqbme8yEpiVSyMfMykHUBg2gljIq5bu5E5E
 xT4Mt/UFc7laOAxMO22d+8jjRjGBkJI7RjWBjizU0h85HLghjVMGPSvJftkdO3CpeKSlmO29vqJ
 8qJdTyfFlezSjANhgYg==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978b84f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q--SMSCEpvHRqS4MLmMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: b6Q4CqeuKCwt0yZj9VkX-eqxrFU9a-VL
X-Proofpoint-GUID: b6Q4CqeuKCwt0yZj9VkX-eqxrFU9a-VL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270107

On 1/27/26 12:44 AM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> doesn't change anything for pronto-v1 and v2 where they match, but as
> pronto-v3 has 2 power domains with no PD regulators at all, this would
> shift the pointer past the end of the array.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on MSM8953/SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by reverting that single line.
> 
> Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only single power domain")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> I'm like 99% sure that this (old) line is correct and the change in this one line
> in 65991ea8a6d1 might've been an unintentional/stray one.
> 
> Still, please retest on MSM8974/MSM8226!
> 
> Thanks,
> ~val
> ---
>  drivers/remoteproc/qcom_wcnss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..5884c5a52af6 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -454,7 +454,7 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
>  	 * reserve extra space to manage them through the regulator interface.
>  	 */
>  	if (wcnss->num_pds) {
> -		info += wcnss->num_pds;
> +		info += num_pd_vregs;

The existing code is correct in that it skips the wcnss->num_pds
(i.e. "the number of PDs Linux managed to successfully attach to"), out
of the vregs table (which on all-but-pronto_v3_data is a superset of the
PD list, since 15 years ago the regulator framework was used to represent
all power-related RPM resources)

I believe the correct diff would be to check if the length of .pd_names
is >= the length of .vregs and say that it's the backwards-compat case
(which again, pronto_v3 isn't concerned by)

Konrad

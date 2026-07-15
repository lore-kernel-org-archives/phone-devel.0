Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89F43030E
	for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107902; cv=none; b=Q9WxwyUYyQEGfWpmWt7AEjilTD8GTr4vmCtiKZuAu3tFwwaWVzoxT7sGdCIxxByolPNmwR03c++VRYa56dYMR6kogtdxtPA8XSokPc4u0h42V4qsuxhSM2rNMyCVBYULTA0MqzhCd5YAl/4UYrA2lY1Pia0RoodwYBfFA48WY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107902; c=relaxed/simple;
	bh=xPtwZi5RwdtRu4PFwA4mNzCB+LYFKWcb6NhfJw9qcfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qM+1OD0rJgOSvypgT5VsEUHskFm54oZpMIGe+4OLe7nBzL/FRAWE8pRQQQ0gUfI2xVu9cnUIGjhO29bE/fIXTHJBMeMsDQeqKvQyjomeTUohuuUTvS+u0+Nh0bFbrUSvfyCXbFhOED1D2DfPKYncc/sHv1oimGpigxNWZkCtNsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KH36m19v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnoULkI8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KH36m19v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnoULkI8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9SfqM2679746
	for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 09:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=; b=KH36m19vgGV5HK/M
	w7RV8ACfKQtySVJAuWLU1P62NPNnJuSJUND6v6aoFqcAHuBGroi92gm73Wrrlwtd
	EvL/UEG9L3mVgVuKW6IUxYEVdorxW2T+6ueEDXM/2qz+sgo7DJo9b35tUcGhPxo/
	4HSZQ938O+/Mm2bv8WRS0xbPq8+HwSQw0E0Sbe/PIA9aCQTZPO7Mh3zVBeJila8m
	qMfWQvEmhhNEeYXAk4k0ZPzb0OJszsIndxSqGRs06U5wFEpmb9hedHL/uTVmFf2s
	L+KCtPV5nkdAM0CqNWhaQb4JtKPTjsiUlY3bSV7iiPpricoFgZoCNpLgSwXNhgrU
	b651VQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuv1ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 09:31:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737c728b37fso103359137.1
        for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107890; x=1784712690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=;
        b=bnoULkI8wTwnTdhpaC0OgbXEuWMxXuouFZ/nerip/j5u7G5bavXQPkhyqHYFy5c4Si
         GTMaXonvQLDv2xy+Hy6aKfBH3NQ2aFwLVOBE4HwHggJbHgZttjQw4vuyFrzdRiNeXffi
         Pe3iHr4NseoZfHDjWQsPOnJThUvOSo4mvIKRoMSV471XT11Q2CDj316cRFF6y124ngbl
         MU5/rdF/aAfuSEqx8WorqeTly6sXTmkpZOU83KjaAF17xmcAojHhCzTHPjeb4AY9MbwK
         Za7tM1HB6TKTRpgXjB/vqHkuBpwqjJO2FPAjBjPuBuFJEFJlhEDfkwjK8R7knxPGz0yG
         hxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107890; x=1784712690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=;
        b=sG6CJv+TMtJhrQI/jT4cmHdZBs32g6lki4zznATc7Y1n82rsK94vruf+Q7F1+RVn9t
         eIXfyAp43szMkMlvegVnJ9PsCGnJ9S74nTTOBzbOGk2jQtsA0BdXfQS09PZS6C/9ig9i
         T5a+5SMRnt3Phzplitj4FKOd3kqPHNBGMATBgPsbyGFqctDLN1/4E4Roh0Jjb1/Aotzd
         Vsa+9Wyl6+345IxuKdvK2X+v+KRgaA2ImKH9UQcqhzFjPczBbS4cYwmqYlgfxPgogvbw
         4xuoh7ZfmO42F8OrWL8VLt1+zvbEL4OpjmkYt7eVcIhcg1V366TTQ3aqS2EEeyBekvVg
         GfVw==
X-Forwarded-Encrypted: i=1; AHgh+RoCQsIN7Hj8FzY9Foxm/q0X3dCYbXxLZpnI09a0SKwIMEEOaMphQZ4uVIFiQEIbLeRdRld5ejFUlZ5HZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXPBYQ0DapiHA3fysT2MxVe4w9iRyNJ9PmOeCuP+TkRWU1DUC
	pQcLC8q0318WSizIijzH3gCs8TMp6W9keVy0UzhU/gGZ5uMUA4WwMQBJ+HsHhVjKihFVzICXBA3
	F0GO84WuDXH9dhbV+1RVnA/3zetOrTOFfnIFWVke5XAbcmyA7WXBXuZ7govzpviYVhw==
X-Gm-Gg: AfdE7cndAREaUyMh/F4xt4K32ylnmB++xwqRxHEdZaGgcCFeH0z7MY+l4SyZWKD/VeM
	YJdCugFz4Lox6yhN2jwSSipoQeX71Re1qNFIMgSfrS4JtVppsRBLR4jU9R3kJLQFHGOq8qTu4yf
	P5ElcP+/uuvW7Ht+UP5Qf1iuk+xa5r8f/NHW6Mf0aZu/FSyNBObCGfA9egMpQc1wrTlIz72aRTB
	86mmYkLKrMjEBA7lbTlVWY+jj7eCOpsCQiMHfl9v/dmiawWzU5UAqbQaw6oVDyni5gsAT63sg51
	hUXMo1DqZi1+Eafe/Dt0zLIOW+n+rVG15cK2h86Fnqs0R3EHIdyv4iyn4xMFUvR7phU9o3MuZak
	UVUD28u2N4azChXtfsgk+MsOvujxy6OHzTIA=
X-Received: by 2002:a05:6102:5e85:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74533b1aa72mr3923440137.1.1784107889862;
        Wed, 15 Jul 2026 02:31:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5e85:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74533b1aa72mr3923434137.1.1784107889467;
        Wed, 15 Jul 2026 02:31:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd288757esm2743992a12.9.2026.07.15.02.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:31:27 -0700 (PDT)
Message-ID: <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:31:24 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status
 before configuring
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ps-DQUhi2xbAO8O_w3c-Zj5ZxwOXBxCo
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a575372 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mfgDh_fDUIA9-y0A_ioA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfX+Qc+cw60vYxh
 8mJVfRhXdeucLykbxmSFKv0ux2/Z+BXrghaDIDGsfn6SmVH6tyH9xfJR/SCcXFRpH3U3eOU58xY
 IdXo6gBTlgHprLMM+rhGe2q20m+CHnhyd7yMaD7cW3+ZLbel1Qo6LiNvC2HJv6lhFi8/4GlZ2Nw
 B4R1V0cbLBPbISiUNdpHfAsDhww388UVDkp9hzlAQ++Fn/bZxOwR6DAeFCk4X8WjZcAzmL5rdFm
 A7zJlipYXPGvevY7EyJFp/WMorPmoweHh7m8qdnyZ5FEJ2m1R2UPsPKlq5qqiREUsE3RSmS+KUG
 ZFlKaztDFyyoWqZRrE8NmNOMnFmtkMaXg941rC40Op5XPCldXbz7elZYh09bQthYa91OJzgJqob
 rXmYT4EX0lnyXvjKWumDBA6uquiw/AzU/GZJgJ70ALX9hXca5wxw8558aKi69UaqsDWvZP9ggn2
 4/hevLS7C09qjwtrpkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfX2JKvzTZE3gET
 65HKqjUwDH1SslOWaLQwDnPPrpOtgzq/dYyihwejz+rmC3/+awlJdCSz2tQ/NygOL+Dy77z+YdB
 vvKcCQ3ODXyAzLGhCxECmLVTCeuCY+A=
X-Proofpoint-GUID: Ps-DQUhi2xbAO8O_w3c-Zj5ZxwOXBxCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150092

On 7/14/26 5:28 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> On some platforms such as SM8475, not doing this may result in graphical
> glitches when the mdss driver takes over.
> This fixes the aforementioned issue.
> 
> Fixes: 3132a9a11e57 ("clk: qcom: clk-alpha-pll: Add support for lucid ole pll configure")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

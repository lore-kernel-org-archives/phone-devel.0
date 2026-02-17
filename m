Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353F305057
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320155; cv=none; b=CfCiFH9I+Cle2B2taSoSqsQ4oV2L7lYoqXKxnngVrYcJgPE2CRJnO4/AQEn87Es+ANihjF9F008T+YWgVtdrHsuiE2h+T7bDOq24qEv2SimZ0FhEZ628xeQcRqopQxnTKbYzEnqWN/dZACtDJheq0BAuoF1s3U1brRwDruQy5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320155; c=relaxed/simple;
	bh=6Dt8poNtf+/65HeetBqu1bzCoVvA9UOD4jN6mLRIESA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gf2Nml6JqJvqIkV0NKmvhZWpsE74KQ69eSO7LZDRQ5Or49AHwGi0uPVcTZ52Qol0t+ZOmwYJnFojPrZxztmIkP3zh2WfqzCGz7OQI2OQOEE3/O0aTE45eBtzzMjwOY1Enk9wvvSzlnwSMXB4lwpFztn2Q5ylsXBwGIuTRHg1wN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gT+7y+9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIMXUScE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gT+7y+9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIMXUScE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL8Gqi127040
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yyu0G7HrJVDwCvrOA+klhPNw8TlRjknAabjrLtabOA=; b=gT+7y+9GTnovw/Nc
	mdUy/cAomGRFYk5N/EmTWWdW+v9ZOitxwH8Ffe61TfbPEtofU62KxYad8r7tqlDq
	uRcYei8WEdGX3JUrbnU02i8/JYuKA5Uz6I3r6s9x4Pxd9rc0MkSM3H3bMc97P2VY
	CBY4by3l2I7Zwv5rsVfX+5zAR3XmFSXI+AR6Ti5jyRxO6IgszfeY/t2XKuuhHjkk
	l9iVUmv9j7rWdRn+qiK7VoHS135vjaw0nu/FLggHuo8TschvKspq5BLAHDGhNpN2
	4sGJ4sjnHhU8wBM6aYMiDLm/5Z1A1yOF4bkzICK5h2SZUsvH+rXt/J17ncMk0sP5
	k6Tk2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujv8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3978cdb2so282562585a.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320152; x=1771924952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yyu0G7HrJVDwCvrOA+klhPNw8TlRjknAabjrLtabOA=;
        b=eIMXUScEWWcQOCdSXwaAQ9BUEPlCBwnIXLXG3vRJMOMzK7qnkD5sTADrVUj2IxvV60
         REUy7vJ8tSCjKJo+j/o782kGaLhD6pcpaORyrCS7V+Vgz0LQZFxmjBiWZdj1NUWlPjKj
         BeQl/oIv7fRterHSszurF3IoDaly4H0H9S8ZsgWJlwsMBj7nlJhHXa8DMVAwrHLpyTXi
         zxOQVVWuIbR6dkTy30y+zaW1dQHtBEO6S3RD2oZuBw1UKq2KA/qMGHuREP8aWs3rX/Ok
         49w9rlxg3mLYUAuKqOVfLHyTWfcNYJiOYNN02HaAJ+baPGhGex1riFeEGT4LR5ROI6o/
         nG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320152; x=1771924952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yyu0G7HrJVDwCvrOA+klhPNw8TlRjknAabjrLtabOA=;
        b=UONrfdEN/G03N1oT96Nqlh4aBoqLafYNqyLSnkkBB9T8LqlCW1U/iHOsehHSUbi8zB
         TQV3eNEW+fQwiPSkSh12fqCCpTS2spAykXxNwNwRLohjYzwvfFvd5fTtTP2KcY855IE9
         6r02owheTElJlbkqcUZ6CKrK6Cg64yoiiB/KkY3Nbbu7cuLIhW9PpXweaHp8GSr2+PEz
         68w6uOJBN2wizKCOgusn6/58g3ewy5hEp6XS2dOCOvl5MMuEfwyH5SChvxFXLgQynUno
         gyr5mNzDdKFCToNRdO8f2atvVIs5CMkzqxT8DBGBCf8PLioIhRr8dWpUQEZvtZQ9WGU8
         Ylnw==
X-Forwarded-Encrypted: i=1; AJvYcCXv6TLo5ihab8ChY36pQCTnuQS29YZwCudl33AjuMks2ZuGeZj2d1YaUSWMI82dBDergUBWzTvOVcFzAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7h6qVj728DA6PkAonmakQ/VYwr2oUxjQET9SuEKwyKQJyofk
	VFqx7ryc9tX1mF72h/RSwumNDovpchgj8f9K9ADE7qt++xahCUBnlKwubD1L3RnWTTZodc8Z+0X
	ByYbvOTYOkSP+SSHx18mSVyWAWe+nz3PewMF26X4dCl7uX7hDs4IOBnqjngKdDnvOuA==
X-Gm-Gg: AZuq6aKGlelk/ctYN6OnFDw5uW1jlAjqwCrSPv3gpBt9hMLRr+oRbufQ73L0wRWRZOi
	hoYJROOu3BL9lK9/Jc8lhxg8CUmXuva/kGbep6USIKIpcbNO2/G5LOtMAtBuInXt2mGidVPW1l1
	TGp2dxP/HqZDbfpeFEBqSb2too+/kGbzwAummJ7Nbh5rkWswJGH/5p5FMtxGbRxby1bgYTxfCgt
	M/tSJm8TrHRtB3tpMh+zNPzt5AcdPmE6RgTJm4HgajSXGEGsERut1nSDD4NFzxUJPHYB8BnohSB
	lUp3Q5aWqIUvaQ8+dVPP61GaxN13FiNw3DYWLYZRJxIa2I5KlY6EB7ZbkrSc5x4LdmdehzbQCy3
	OiFaY0XLumYW/dVghTEccQOV2zlon9N+/jrkRFHuD9WySHbghMt5Y/anS2JkKNVvVfyGAvy/fFj
	D2e2A=
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1233148485a.7.1771320152240;
        Tue, 17 Feb 2026 01:22:32 -0800 (PST)
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1233145985a.7.1771320151812;
        Tue, 17 Feb 2026 01:22:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm347299966b.31.2026.02.17.01.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:31 -0800 (PST)
Message-ID: <610b3776-cce7-423a-8e6e-9db61f53c9aa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:29 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-7-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z01f_Rrs-Z9NeI7396NpQ_skvz243Vbj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX2k1YBiAK1ERt
 q8azhvVs7moytGzh/UJ+o65k7jThDaSPv+qznw6lwxdmGp+QFxScH9ZcsJrr9/FEx4Sc5jxDxOS
 /ETFziTZpYy3wUDiUg42JdnVE7IOrRdlLL2k/7k9vcRDVnx2LN+erDBJQPTNoTNuCAzBbu1HkIE
 BaX0Y0CN8kaO3ruXSRL/w+bRIUkUKIlgsKHD8WROLTtfGozTCI5fzRw8hoTI05etWBp6KYDMrKj
 bVJoLnhlgCxcDQ981cnmmMzzXOh90bS09j2JwIl8wDScfJQhNgVisfBXcFHDTdIGaat03lD4sWE
 vypdT/py2hdA43pWHmxWRe8fRa+Px/cJfFhnwlItUDSrV/Ge1BaN1ih9f55G67rJk4wpTjh9/x8
 VEFinN++QfLYT3rUhrv78k0EpZ3+3NP4v73z4AkFet0izGmGEjtWJq6Wm2XsIwgkI0BRDkyYVF5
 TE82F+UDDA6wivCltlw==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69943359 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NQfNVa4L0IZK2tGiTpgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Z01f_Rrs-Z9NeI7396NpQ_skvz243Vbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077

On 2/17/26 12:25 AM, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. Otherwise, unpredictable issues can happen, e.g.
> on the motorola-guamp smartphone DSI would not transmit anything.
> 
> Wire up the reset to fix.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

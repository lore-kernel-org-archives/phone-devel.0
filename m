Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1802119006B
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405544; cv=none; b=OoJcUb2RYgDuO2R82vN8mL67Y3RrncdrI8asjw05LrndC5ryoBlfAd4MOfiVvOP96YvupuwT5CeVUTp6yE3acfyMIH4YnWA56yj07len2UodtoTFYEJ4VyprADSRMv/ViWMrGC1+Pk57JhdWGcFQMfSu0tzQ6UWWUkC++2zcCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405544; c=relaxed/simple;
	bh=/v3O5LIsNdvmyFQOs3alTi+oDxl57BxySdABAtEvKys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCIypFLPCKcBm6Tu/xW9/bCnNOAEoTfpaDNOixHJrAT0v3cMiDp4PEM5C+sWI+rBgvGn3+ziN/Cg4ops/HxvV/zJ5J18QWnBewlXnD1uvhKgmXkMw+S5Fn4OZ222w3RTCPx81YfSPrWl5BKiTivKV0L2oi3RAsvcsc7mkMbK1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sjj9HY5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=il2f3WcC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sjj9HY5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="il2f3WcC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9U2Si1499474
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI9pyZxfoB137M+5pKNn/B7T09Jp1/+FGf1CCvYzDl4=; b=Sjj9HY5Q9yto9xT3
	2yfPBbeoUJz42lyWsgvUjl6WxZszoQGWJO3G4eO8S6ZSRyTnHVFYGMEaWreaKFwz
	EDWU1pILBaS12+krgGoY9VbNJaLsuImFKdSa1V64AC/YI75IhnX3H0VtuwbmhIYA
	/eJCwY2TwrrdKFos7TeloQIgVvMN+xSmuXVXBnHB6N+vkvlDtwqHLx3y/7DD9aVc
	MynnrGgLnFIiFNEvJaBAErG5n1LQD+HXzee4N7wh0FkKAg8HdBPuRqwMndRV6d3D
	X0mPmjQRrmtMBrvmCZNS1d0r4cX1xkmYbZFggoZcyzVQztppycM+a14GnQfMURRU
	ehP7xA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgj40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:39:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8e89d19bso116683985a.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405541; x=1774010341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI9pyZxfoB137M+5pKNn/B7T09Jp1/+FGf1CCvYzDl4=;
        b=il2f3WcCvz3KFIBfDUhMnRNPQK7DfQbEv4XC5c17Zm6ofCSH79ybl08qQQl4xfIO8C
         fn80DWcAlAv5jko9Eh6wxgMfdhVDXoF46ITINPJ/LcDRg/UiCMciTia8/qfYN9rCnxB5
         hna3rTPLuk12u1ZW7Hewk+jVUVCiHdFrqfPwdfOApi3EhiyF/e4GzVzARMm6eKww1e5y
         MCuthEyeEk0Ynhp2HxtyUxVwJCa9eizgwJdzFV+ecOOeegTLjiLcf/J0xpvhgppv6CCb
         febwuy+TU3AE43TSlFYa4szRGR+3KRvU6YVg6eASVNoaz3pLPpAfYrHHFgGVAHNkrvWu
         /MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405541; x=1774010341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI9pyZxfoB137M+5pKNn/B7T09Jp1/+FGf1CCvYzDl4=;
        b=OWrxzFJib157xuRuiVZdPrRCMV0BhY1xVwnLJMCNDNTeMl8czX3OFizGcltmnqSjH3
         Fixn0xv8JPFKVpmSSWqv2cZcO6ByIR888/Z8sFOw94RI9P/AreghhtEkNXIF+pkm27F0
         bjOWAdFLP7vtcvqKmwsZArrCp4gY7/HHDmASPJ5wqJ8Q8A90lvkpjxTeMgkmng304ZKf
         X66CPUTaqQRbqnczDFgw/4EP+UD2ZouzpUHrE5c9ucksAGNMIflNiviYLvDkP5rIjf+s
         dzsYOiKo8zuCuu8dCoakamTwh1BQMHRPQk7TTMdiFfKjadulMtoW5Zz4hzRnYpFnQK6G
         0QuA==
X-Forwarded-Encrypted: i=1; AJvYcCUG8bXv55kYoG2VTJUiTX+VXTG/kuKVthX9Md/2gKI63uIpc10Yx5O3C5UdCC41crlA7rUrfaXK+iYWNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+vpMGyXNh5ykjFnrKywKBzKw56jP29QwIGTJ/OPCqWKVVNB08
	/vFFFjWKZ8hSX7etA02wEcH+Y8V9cnSMHKknSGTCJvOX8UaSjkXUpuf/AQnTgYRSmDUGQrhobP8
	JSr0gOXa1J774A57WM6YFxFkc+HcolmtyJQ5ADTuZsQpodNyeyBmCxgjPyT2aJXZASg==
X-Gm-Gg: ATEYQzywDiRyIPfLDRhCRaILUrTDVCOfTxO8hs4ti2EExFz5U89j4aKi+5smoCskfgm
	LfmJB0+bkHOeSGSs7BpCqAIB99OcwnhLV0SN/bSfwdeKaIfl+fdkLtUCfewivXbLzaTpfBOFtJb
	0K+UKAGY36frvtiQwpxMMIOXXYgPyj0qTRNjIK0HSZXUkJ7k+Zs4qtp4Gl1TT6YQcDbeMayBKk/
	u5CAUE8J5v0+2IjEIBc4pYVL9IDFeJUY/YORM2zY3vZKrp6emS4nm600zwBeIBBVKpi4eKyGKu5
	AYrHk1cclJSd3j1jFcIDEsUb6Rc3d95gkFIik5kdgxY+CBv59RCcEsw64tfMBe/XKEtkiC+TaDs
	q1DXlALh0U6ce2OfbmbgKuvPhyLF372fjPtXTK/7l2n9HbtApU3vcjsR2aVEB6kWQALWy/nZMcz
	ffRG8=
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr309514685a.3.1773405541569;
        Fri, 13 Mar 2026 05:39:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr309512585a.3.1773405541090;
        Fri, 13 Mar 2026 05:39:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d6ec93sm1270516a12.27.2026.03.13.05.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:39:00 -0700 (PDT)
Message-ID: <e65ebd79-9edb-4001-a5c1-c4b6a67d5234@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:38:57 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
 <t4uhjpxdvjxda4dxkoxktv6xlxg3xvzyslgerluu3t2dzxv33v@k46gvwv4uf22>
 <137c19a3-136a-4e0e-b4ea-8cc474172d81@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <137c19a3-136a-4e0e-b4ea-8cc474172d81@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b40566 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=jvAo0GstzFGwFXuFv2AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: kloYIRLonR-nSKj8Lsk9bqwEUhlKnX20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMCBTYWx0ZWRfX8j7NPJcDksAJ
 FqydQGS13A6Wy0pmEuD17NdQm0pCBn4diaSBm70+QtLto2gqySDJzcxspiEkJ5pPE2c/7l3oFKS
 pM4oTXtIddWS9/1bE39+Y57NEYPk1Ber9sV8Tq3IwudgsMOz5NHnNz8mMzEeVZZn/EhBCw06qG1
 fAIWHE9ZQ8sl4BajpaMZwWLCuPXhUQO2bX+RkRobE8/JCQDDXtUYHM7oSiOtLc+3c77Z7OwJoj4
 sAdgn7oim6e0TT8iTcPASLv7siiYJyXRwdrfMMygEiAJahTtMtabVLa+y3HVRBZQdUrzK2yDgXz
 gXVS17nATEX6vhyfRs8cxjw4Wp1e6giryOKzkt+sTKnAp0S7TF/E4jpByLHbiVESFd+4FQR5fcV
 FDYImpGwas5Kg4F0dHr9O41E2F9rnELXQz/0UQ80uxzk7S/5x7b9rl8fhS2WhCfZOycOrf+CmHC
 mqXtfVaUPt2us4ZJkBQ==
X-Proofpoint-GUID: kloYIRLonR-nSKj8Lsk9bqwEUhlKnX20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130100

On 3/12/26 12:25 PM, David Heidelberg wrote:
> On 12/03/2026 03:46, Dmitry Baryshkov wrote:
>> On Wed, Mar 11, 2026 at 07:44:30PM +0100, David Heidelberg via B4 Relay wrote:
>>> From: Petr Hodina <petr.hodina@protonmail.com>
>>>
>>> Currently the panel driver for tianma is broken.
>>
>> How broken? Can it be fixed instead?
> 
> No output to the panel. Definitely can be fixed, but current situation is that we don't have anyone who has available time or device to tackle the problem.
> 
> I know it's not optimal, but on a way to achieve working mainline phones, my thinking is better to mark it as broken in mainline until someone fixes (assuming Fixes tag and backport) then just going black display (when we have at least framebuffer now).

If you have a person with limited time, would simply copying this:

2b973ca48ff3 ("drm/panel: sony-td4353-jdi: Enable prepare_prev_first")

fix it?

Konrad

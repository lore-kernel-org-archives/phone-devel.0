Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0E404BD4
	for <phone-devel@vger.kernel.org>; Fri, 24 Jul 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894230; cv=none; b=o5RKmpND06WhO3W64THkx92dR0395+K5Byln+wBF1L7uIhEUT5uTlYbz+js1+2YLIqHt/KATp5pAPxytKyRwo3/3J4KLNmMfGU9fg5xqj3GDA6l8wwfkCn0jlYjQWqJt4VUdb5vwYdPDyqKW/KvlKGiyEBBNJIP1EV/gWWkuHRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894230; c=relaxed/simple;
	bh=kZ4DyWaacZcCwlweWQLa4Y4zB6FfjBFIuFHC9igNK+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PP+Xa3tW83Aj4X3M6qcps7iHe6YMtZIHaPZEzkQbmenqlGICAcNqBZcICPioQJ7jt38uUipAwrb6DQzAwr9mPFLMAV/WE9wxbQ3oPyxogsQYnREZH/I+QebuDTyEjUudBjMp8kfgSoUnq4PmQABk/eWZzQviAAOROin0HL9CcjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJucg/rA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf33GaH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJucg/rA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf33GaH+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsR12616247
	for <phone-devel@vger.kernel.org>; Fri, 24 Jul 2026 11:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=; b=aJucg/rAa18XWXhH
	2YyJtYvCnEY+XWqHJPwtPegNavMkic4ioIc9gz99wQ7XampUN59kwvJVF93LZzjD
	IDjYJpDtUuoj9qE3jsUKPuQJDoYDCfB8kWZdC9UcWXINcmBCwCwKiG1O0C+r/M+4
	VPiJCgIqh74E9TAa8MZk5VqEZbC70/lSKtoce2YrFxMVVKtcKzHPxCHYV/0OMipm
	ffNAIWpwWwxmwX0rkHcxNIVwBUj5Tg/4wX1CWQQfJ5y7NTWgYqzGoYxTAKCQYvVM
	pYZZbm6qqBvJB0p7M1khL3YesgdAwNy8ZWrxjtkwpe9Q/awurEIliR0wQXZnXwpQ
	3/BndQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9mxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 24 Jul 2026 11:57:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so900621cf.2
        for <phone-devel@vger.kernel.org>; Fri, 24 Jul 2026 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784894226; x=1785499026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=;
        b=kf33GaH+aPSvuyd5PKKfm1zB1Z869iZAzyBNaIOXYzv8HjajLlTrDl1huUk05GNIVC
         V0El12Sszn9bYaDhieX+9qs+7X2TBOgKinCa7e2qGcbH0ok5EQ3pXiiAIcyDJxDT5Mn1
         TA7q3wAX5l8fxCfmLJKpKb9toGtTLtUod0ykXNyUQ3KbF0noMIDKwYHQRKUoBtUwPsUL
         xbtFyfILlUkbOZJSqCkoVsk4VNJO0UT+pVG2MWu33d6b1WqMygpHvyuVDVBb0aFGzevN
         AJV66a5vFo3RLXLv6HI3WQYloQ0TtYJiFcUQ0FDYB9NdQOcrPOJ4gxDtO1LcIdUFnUzr
         TH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784894226; x=1785499026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=;
        b=qYPOi0/qqRh9z8FXRKDLyrgVQjk+Vb/9iV21V8kn5+siENcw7rLb+y/r+sHcENQ3wz
         Um33XjxrqbY4BCL6szao3/ah2GkqRX0pHK3y1+TpT5VR8soTz4DlKGyH60yT3HvUSYkP
         Vjgw7+itVv6ZvZ6z/wat93Vv8aLHk4+dNOg84yvgtCdxy/QtNSvPGgIHrbVq2zxP/4dv
         FSLIDICtCsPneperq0pe6tUNa1xU/bJET+tbKxWcuJ3fzzMjb40JhgNuhh/xVKnsnh33
         fxzojzxG6Bg+/YP1ZBqVLPtqjE3Am5zOAFG7M+Caw1UjQAEz4QsQ0CUoPqb+jhn5+HiA
         wxmg==
X-Forwarded-Encrypted: i=1; AHgh+Rrqokcva98/wjwNdx+iX19r4uIwhkP6IgKFnxBGFHOH+xwBWI5f9uzsQwenkUiqBODqqPYSxQV0V6DfsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5/T4qDmNwrOnIXG+kLOMRzZSmCHJrZJo2cYwk+lTC3G+q6Wz
	enQMuHSp3mNXLdKCdWFnWpk0FkiDh7Fp6WXWBJgg3BTxUHdrODgzdgZIGKuLGcB7lnfTLuqQS4t
	LRdXlLQN9oBKU6QyzcadmAlVVjO67bYSfmQJ8NjpBDfUg4W1GBWv5XByOPdeX5duiEQ==
X-Gm-Gg: AR+sD11bdEm7AQElFmk5mNpA1jsk93uGukqEdQxbSHisTB3ogo1SNJiHP0C/0Lg5LGU
	tMranf6laSYbhBeCRsdCm6UdMZunExw3s/++CswAwuGjBEO8ZdUB5ykEOuvAkm6F+Rs79l8kWqw
	4e8cfxJzvl+ZHQxCxCFZEuSST8D1ydprVpgxoptMi2oqvRw8MQgVjXAg9lTg8IElxB835Fs1ldK
	IN8CPDgqIy7gDu423yzOzuPvETQbzXuQLf95Jsd2F+5d9iinjRjSZObE9wVF+EPeeES7PIC4d3+
	/rgGCQex+RfLTErCqkeexFXuoGp1xJFY0CuuYM2b/naz8r4iFb6SQEl8HSf43mv8/ajdLJT8+bu
	93ECpMbhMTnELWtjE9OWqLg+5
X-Received: by 2002:ac8:58c6:0:b0:50e:6311:7380 with SMTP id d75a77b69052e-52849848177mr27015221cf.6.1784894225893;
        Fri, 24 Jul 2026 04:57:05 -0700 (PDT)
X-Received: by 2002:ac8:58c6:0:b0:50e:6311:7380 with SMTP id d75a77b69052e-52849848177mr27014991cf.6.1784894225496;
        Fri, 24 Jul 2026 04:57:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm344516366b.26.2026.07.24.04.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:57:04 -0700 (PDT)
Message-ID: <b9499b67-ce3b-4493-a1aa-454d97de002f@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:57:02 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for PM8350B
To: esteuwu@proton.me, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
 <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfX/CRYG8wfzLei
 JXukebb2HOpU/llrzefpRBfhYSoU8toqqZ8z07KEHVs8xWwTA+L6ilK2ouvJLNSVj6UbDCRgCVw
 OGnZuihKfMCe5pQNVFSh3AXPULWSNPgBlsjYuD4CTW6i/fwErl/fiw0+stznQeif4duGILNcLoO
 fMwPg0mMNrGel08hhOXp6bGcDqjfSMacily8px+c/6VnJgssBaYKuDjGaj9kgOSv9eYkrmWJ1kB
 P0QwiIg+4ZDM6qy0CcR6lB4J5u55svbQ5LEk2bpEv/F9e4QzxD4UYCLrlBKMZp29XuaT8+pP3nP
 fQOM7/1+M31CGmGbC0IFpUZLKYtJfoTDIzbMRVsrRPUl9uyDxv91qu4c99ga5Ngq6KM2VHtHx8q
 Pg8j+Jd+0AR0Daay/Go4bXK0keCdpBS/YWuYxb8pJTHmy8VLWmzwI4yekhztinGhp+zNpfCU2MG
 D4YDVETzO6C59ZNFFmA==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a635312 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C7i4eJ8IrRWg0_eoz1IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GWXhy1MgQYQL2_8h3BYkI04GVQ_L4-vM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfXxL1rKu1m5YCK
 AcV6ksGfbkRIwEpT25kIBJxpMWReKrAyXA6RAK1dU6Gh4mh2MfIZKP3S6zCueLQL0LD6kA4h7fM
 Nfq64KK4MlNN8h9ooMBYH6C7Ef8Dok0=
X-Proofpoint-GUID: GWXhy1MgQYQL2_8h3BYkI04GVQ_L4-vM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240108

On 7/23/26 4:53 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> The PM8350B has only one LDO, which gets its power from a dedicated input.
> Add support for it.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

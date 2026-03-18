Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F913DD51B
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844939; cv=none; b=YFLokhTE/qGpqpJJgdKbBeOD6PGq+14nd38+R7MNLbv91zvoz5i/TTyF93fjGfxLckgM4B+ECxTVKby2oWwo/+MFRmybJETs5d8g+VMsh1jOP7f2b9bxn5aZ/OnQtiBJhvwodRVepDfekYXgD6EzV4TjQI7+M4cdyKtOAJXnqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844939; c=relaxed/simple;
	bh=+lm8/3XAZ7H3Dy09b7Vs3as3vdTiEfIMShwBN03+TRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUIbwRb297Y955TNj1NMsEbYc37BveAikPD5r3ADblGQbzkW3mzRU+nx1k4TwEAduMrSBI6Dt/dFHNZLoOve3JhqMmjm8X8AImxhKlXvPtWsfcXQcQnMFFxLsbgZCSbP/xOYeXAqdjDEtRKcYQ3myxxVNgNqkPT2diJlzA7DMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lmS+l9Lv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCnghzlw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmS+l9Lv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCnghzlw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ID7rm92613396
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0R4+Iy3LR3CasixwzcVINmeR
	kUOvdSZcaHXXMIfjpq4=; b=lmS+l9LvN7kYYdyrz0jWsrCL/58eGslGzdPbFcQR
	vX79RJ1Rz8dCvAG4mZDmtrmSO4Qo8FjOOwnDV7kUAFF7bvdkqeuRd7CEm7QFkyBi
	qgsNS69cw4/RuRw2x9AgP+YIXZ5is7XHuyahoYW4sGBiTZfEM8F5HNtxMkHqHVBP
	P64Mc8q7tgRBC7hvwPQJVoqQZYG+nZABJFvnZUSXagRmTnj9JwYdGJhDl8EtWlNm
	31PhGhVy/eXSj/zpXo2W2ydFtTVdkvueO7dx8cnn9jsXGJR5UxphCV6Bd1/2pAkR
	/K80PLA8urbrT7n7+BMnDIjkqO7sRjk/ucDLJRBzx/bfjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdssps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:42:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509011403a7so8841451cf.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844936; x=1774449736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0R4+Iy3LR3CasixwzcVINmeRkUOvdSZcaHXXMIfjpq4=;
        b=SCnghzlw3692zzGHl2fPFJFdw9Tfw3Z2GodsquQSYVHh6t6M3nIHGgWF+18Yghm4DJ
         JAP7BXoZHZ75ZKdlFWUrMWFC1uJbxr/08uRyGqNEx2+Z4tWhgY1WeJpiDWTDYEyfWDAw
         LMq+l8ecFwAHySU/1k0mO5arVRHZ/cjFkt67+lZqhrmKl1qBINv03HcFybm/eG3xH5Fn
         72yjTRsdOM1j1XaIpEYvPzWlNdF2lS0RB6QEcRJq/WkWF0eFyyUqm3Hzhew1ItPeBXao
         kKmmpXh7F+S6cCxZDKRYa4Xti9sV+cWu+oYPMh8DUHwzWbSklU4+Js+g9lNcgtgv/SzL
         jLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844936; x=1774449736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R4+Iy3LR3CasixwzcVINmeRkUOvdSZcaHXXMIfjpq4=;
        b=mFLxqYBLSd3Xg//1mdjpLPnJrn7TgG2wb24VJGOVieMNuBhusRFtla5kZepsmivRGA
         Qee6NsUOe1lOteRGF1JiNdu69gwSSI3d84W4FdTVIKo1WmgtFYXxUM8LfecX0HDS3dfZ
         INoptNT4K6/WygTK6prnZaW+sJnc+SH6youHfk2J4dOb7Q9xd9Mzdxh01uFAKQNtNH0o
         UDQqejz5ZItn01xgEKMy22tf7rr8nDCcKxTc1GRH3f1Uu7rX349ofzuBs5QGf8OZyPQv
         G2M9xam+dWbdKmFUC3dcDxtC2IiRrbiRABLovwgz9Ugb8jy2esY5vXVywI6KnFCHR2mf
         DwoA==
X-Forwarded-Encrypted: i=1; AJvYcCWXhH/VJSttVTt9vPgoROjzmLyyUE48bprTK1iwYs5rxpzAsnEx48JYz7CahwUf272n6DYV2ME8X3bsdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLhmnugPvJ9JVacImCDyldEuqies5HBxihdMuxvF9I103v6Kx
	WwdM2wEYrpjTypTYDr/LeH5YxUsNjOUrKs16Wj/eDsWe1hu6nI9Kks4EkA++zGvEzQOS+DiS7Fi
	faWEEF9FJRjTZRkDEKtJyLhyQXpfkSmng3bZaVjk4CY+3agauMBJhmJqMjrLdAJGwzQ==
X-Gm-Gg: ATEYQzzkrhNOq9ujmOSUKBT6nFmxAsBWNXoekqM0RlGAcxFaxldilpCldXzbwCs+NdB
	ZSoRES8a71ky0wJ7OZmBQE/hzKErdIwqSe2B9/5qrtleFiVeXcGzU2GIKLBdRmWSPbfryL8TMV3
	/LQw/ycB/rTeffjCSZf0iHDNjaimJW2JZGcPt0t2y86tm2i0/YdPCEdvqqzYMCWJzypq4gXJPfK
	XF/kOx5xt9j1hlTxEbQ7qo4TKcRyAe5FgAB5TQPwVMFl7WkUt8K4EX0mf3V427fXNNzuHVMDJgA
	yUTRHowmnD/m0vqQD1wFiosclrAL7SnlfMz7aqCykQB0dNCO1yIhIgnALCJJTK6c9YAWSKEPjC+
	Ajbzv/WIj4kcDaiPLnroMgz7tXv8brxQtte59Z5bwfa3nUFyMX1/3XObZz0gPfXtVG5RFX5XpEq
	JFbJ+avClK0dSJQDA1gAKFvhmfZCTLDV55bo8=
X-Received: by 2002:a05:622a:d4:b0:502:eba0:b60c with SMTP id d75a77b69052e-50b148e730emr46479781cf.65.1773844936429;
        Wed, 18 Mar 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:d4:b0:502:eba0:b60c with SMTP id d75a77b69052e-50b148e730emr46479141cf.65.1773844935761;
        Wed, 18 Mar 2026 07:42:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2bf1csm590149e87.20.2026.03.18.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:42:14 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:42:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Convert fb to use memory-region
Message-ID: <q5x4urvyxvybkhonsbncskf6vefyxasmrftbpbjf2r3kvyttln@ichsydzf6cha>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-4-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-beryllium-fb-v2-4-36b69dfb760c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNSBTYWx0ZWRfX4seunqBOCFQz
 IvnFSDLxuhMo+xSqvoORQTQOOmcapKq1xOzoUw4D36YDh4YH+iFjaBe7wmwj5Sf4mLBICPXn7uy
 a6ZUdbJVeKdcuigEwo42zdfUrrC/dhdgG98xbnutN0sdFjQIKr5a7E3VtUK4NEKHJwMIqliPf6V
 D5FiAjuP5nhgsHhDhM29tPp7tdDht1mHZ60h9IbvWKy4r937ruKSBkNUqTGC0FhEezE9mXgsKo3
 2uGcG0vbjNHQwY/yyA09hoUaG9bSIVX7xhjKE2FCEjmXfEvXV/j7UHpKPap6DKZbo2OYcb6auwG
 M202leRyb6V5f2kpIMsVN/FxDtLEFpzQVWrJUixa7qiKVpEp5KvU3MgTYRXPa7X1SI6Y4PrOrP9
 u06hu4Z76zj3cgZdDgDMXR46LTReZDpUdyaWgEO5yAZG4MNVqBOqH+VXpS6c1WejEiRkHH8RW6l
 BLRXgC/uk3sAWzHrGkA==
X-Proofpoint-ORIG-GUID: cWRefaDeE_5iioHAUfhF3YOa3gCr3ndi
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69bab9c9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iFDlCX9k0_uCMU9SnYwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cWRefaDeE_5iioHAUfhF3YOa3gCr3ndi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180125

On Tue, Mar 17, 2026 at 11:12:34PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

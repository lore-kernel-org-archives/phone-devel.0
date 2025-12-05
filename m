Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E91FCF41
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967606; cv=none; b=XnoyHyNhTC1971cfRn5/bfB8IUZ7rZKejfXmqJWrGH6hE34H7Ouki7FcSK4VLsWLI8f81omAdbvaYzCbDDaqJpGYZHn/FFj/0hvkcQoeiGNnRlocOwLusHduULHfA5By0s/si00uEwPmuX1d3jcZxBVXMigS1z1CfFY7bQuiJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967606; c=relaxed/simple;
	bh=8ziz5TQHdnzit1ggklKeTA0lwLtqYJ+zsTWo5biHEXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijilxH7TXchMCOQ4LDeMdw3tu8SxsJt4fT1VmB0mlc0QOsyRkz8LUkxyEqMZUJ3jciFyOVmrTXzpXE0uc+c1KJcobkPOke5lX7V+iWXF96yjX+rpTJxgnzA53bJgyp6Az0zgoJQTV5DaKxXWX+MSurnIrgW+GdUVRp38vIBqiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSBw23Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLHxo5hG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSBw23Lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLHxo5hG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5HrPu2866576
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 20:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rvBnu6Ta93G7OrYfvzXO7t8f
	cURSD6pM2QuExUQXjbw=; b=mSBw23Lgl2KuLxHyd2k6l0pPXqc7DdlA8+Ibl0U6
	A4EyoW73D6UAglI0UfghzLaLAyIYsTpLKfQsRh9XaW3D/zIyH56eVK9VuBoyt4JS
	iQZkE5SLFkoJzg2qQ13XdzmVKTuM7ZcXSEeD09s/dhVDVZH7yBoWY6pADQGjrzaE
	sC0BtWh5vG+FsXJ5nzcl9ccVYGjtgXD7E+OJVx08f19ei2xIB3WfzaLb1SMQqBg8
	YLEh2h7PtxKUAyTsHne+98elPqJOkIX7KR1CVbBJQXqxGcahkNiXPS9Ln+qo6Yai
	LVXG3g8oStkBI9k90PBHHvyP45NJ0GiycCnwq4hVoQ+PLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av46f8e9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 20:46:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b4f267ba01so779889585a.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 12:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967604; x=1765572404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvBnu6Ta93G7OrYfvzXO7t8fcURSD6pM2QuExUQXjbw=;
        b=FLHxo5hGai1gKfABTwmGb7rPM9f8dCcg3k0LvIaU0MsHaJCNg29JsHufKqDVjhdLT+
         CoCM5au/zRL0YgQauXZntc5ZQpdcUZPHzN9EoPj6ZMMC9KUbO3xXFsvjzovm9A84eXaH
         Vk+kTY2gnXq/3Bp/xob69AW71K4X34U3Zop34vaasw5KfuH7BEwpG9ICcWS8nJuevdE2
         PuFzGLZVXVUw2SKiDurOFWa2BFrci6waBHzTZsXZIQrNZhSaGkL57Y17qUS76SXT3H/D
         ejg3/Ek/MmQYdeGDJYhFZEgj+AhHaS9wkZiddQQ3pcEHjMP4XETYuZyioEV/5H1UeHHb
         leuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967604; x=1765572404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvBnu6Ta93G7OrYfvzXO7t8fcURSD6pM2QuExUQXjbw=;
        b=YTUj6NHWYNrASUm2W0lMzqUDh6W7/XJZNjeq/VqNWFmX2xtfIG4HcJfi4KGBlt6j0b
         9nC6JfmrFpH76RT10w9YNz3OBt7tbq/Czf3PS6tGefcOhbh2zGOB3gCjJdk84kdmLwDm
         wbiXtJLldbI1vVzukOWEKntiSPCXNHrwKbH4esVJApwizVuymGbSnVhqXJDK5bYA42Qt
         kpgk05kmMwNPwPp240DxcjlDOtQ2W81uwX2kxAaET3qUgH/qJnkTR4Le6dRz9iOMALR/
         piqFIsoAwUGGF3mz8DbX2qimzeS6tFBGZwfX1oFX7QElKlBc3MofA3P4HV7WQx/eEpKC
         ki3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVecWZa412sixOZ1og7EkAXimRDSC+0yCPd4HRRmmPnjH3tqo2wV3StAcINifdodZljQbY7g3GP/cjEaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ePQ/89jdm7xfwSXr7ymsEpg8644qrtcuXp5BYn6rH/ykCNKc
	bLiQpmUr22SR83WYAlggxLnlDlCwOZ0uTzUyCxjLOHOdDb2AqpTtETUxdC9mXom2XEGLZ0TopKN
	u4lbs7yzHuupbKcCmK4qjFrG3e6/Zg50r21XI9YN+11SQZHh2X6dE8XiwF/VNgrcAYw==
X-Gm-Gg: ASbGnctnb60ors2vTNbsF106R3Hj9I09XkoF01PhAz1FYfXzLoi9kM25gwwlB13pNa3
	gxI+Pnsg+mdOcWhwxyOaF+KVi7q9D4VKSk3PhZuOuiyitI+KwQuUpciqZVNJ8jcCAz8YeQI5vI7
	TZPTtDzxUt1UI3qFa6htWuI2tbGYZYdJiCMAjEKU1roFinBskevCTYr6EqMDZ9eKebq5uzj2e+m
	U3j9W5cNOXGjtMZzoYE7gk0wTjzrrDkiUhKENCKoy6+DuPZUzBMBeRO8aCxhBO1C3mhruimOAEh
	emCI7FRPgbGrO9fkPRoUqUn8MhH0FTJO4wDOxPPANwUevFXvU+iRHqDNuKX1We1rPPM+tW8FopC
	lwLxbztoajUcD5KF5/aqkiuVFO3J7+4dUhuok3URi3N9i6fRq6Eq08ZcjRmKAG2m+fsaSDUX0Mw
	8isd1vu/An0VVnaZ9Kb44hTpc=
X-Received: by 2002:a05:620a:280c:b0:8a6:a566:60cc with SMTP id af79cd13be357-8b615f81d15mr1314587385a.33.1764967603682;
        Fri, 05 Dec 2025 12:46:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELetrdjc5iMqya/VsgkxiDLcwMoAF/X1N9KRnuXZaL/BQ8YnfqsONxTkvK50pwBnyJns8LOw==
X-Received: by 2002:a05:620a:280c:b0:8a6:a566:60cc with SMTP id af79cd13be357-8b615f81d15mr1314584085a.33.1764967603259;
        Fri, 05 Dec 2025 12:46:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c32692sm1783250e87.102.2025.12.05.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:46:42 -0800 (PST)
Date: Fri, 5 Dec 2025 22:46:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: longnoserob@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Message-ID: <6xr43qpael72epkdagbna6k4ny2mhhnkw3gzyktutpam6tit62@43sj2oglnzyl>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
 <20251205-slpi-v3-3-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-slpi-v3-3-a1320a074345@gmail.com>
X-Authority-Analysis: v=2.4 cv=Wvom8Nfv c=1 sm=1 tr=0 ts=693344b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kmiW5B8qSYufVaGmy2sA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qGssdLK95tUhP9YsGnHBKGXrcyJtAVt7
X-Proofpoint-GUID: qGssdLK95tUhP9YsGnHBKGXrcyJtAVt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NSBTYWx0ZWRfX/q77t5f+NX/O
 TYD+Gk/MJgNbEDQAs6b3pFRBgt2SirJfa5bRNpFIstSzafB4ZI0AHSZ774W1lc2wc9uPb+rE3qu
 u2F5ERroSH+pEAPoVMiRJ2pqyXlxl8kqca9CN2afyRemLf1DRA0hoFYFwmpYCmVgKuDr+G2Ntyb
 XubrJ6pWPvNABybjUnuOoZm5GwApb6NEUMRlg9x6rsEcAtdyUt6rGydCwDM2+6gRAVSEiVkp8hA
 o5UUXgHxdxwehN77rg2A6kHie747cTWW6iyl3KUQaEWpu5/wj5IGcyAZ4Ty8QWbC4pl1wFVZQw0
 WAuLLAkHwp4q49ks/kNb8pGTCH9j6qGSYIIfQQsv9LbzZCVOFm4XMiqGohBTIFc8GbEm9JGIit+
 Wm6A/B1yC9EG3N3VVXvpD1xhnz+gXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050155

On Fri, Dec 05, 2025 at 10:59:01PM +0900, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> We know these devices are present, most of them are supported by
> downstream and close to the mainline kernels.
> 
> This is very handy when rebasing the integration tree with the support.
> 
> No functional changes.
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 29 ++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

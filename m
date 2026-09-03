Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63CC3F23DB
	for <phone-devel@vger.kernel.org>; Thu,  3 Sep 2026 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417533; cv=none; b=EStRbfT9QylJ4QZtQ473p7gKwU0Zhmu1BgD73eUkidS1vuBy6oNTcE6rBACEW/RGBdpvfoeoqd/OktVnUGT5aHodjmyyVld0gucnijHJC3LSgRKieEk6WIHsIXs7V+0Y/wOVXGg7yM//pK7HRxIfvh2PzoQidXUg9U8DlVZ2Pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417533; c=relaxed/simple;
	bh=xr3EdbHecvtb48ZZz6jAzMvFH3J4sYscKx5MxVg6XRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXpKLWgePrM6dh7syx2unh4a414n2z1oLFsc3OuHzkOhfWk0sF6FH5DYst+tvWqTg/HmDaQkWLXdfWMeuUOTptgG2NyH8AUbxXhyeD6j06JatLnH6GUsrE9bJJEbpG59Ap/PaFq03KFZPH+Tn2ZJRStrBs22rA6q6qf0uKRoZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CG27UCLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdQ/riQT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CG27UCLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdQ/riQT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lTKH3749489
	for <phone-devel@vger.kernel.org>; Thu, 3 Sep 2026 06:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=; b=CG27UCLuRQNkzumh
	I6Qoqg5E21BRxR4VfC/MDWmPiaJsed6D32s3te8LFDfyXyiaagK6NrCYj/1PGT+l
	0l9Twpearm8Cuf9T43Sle87YWFTWiXehgqyWThvqZOvr/X4+PnczUW1sQQjCuJi7
	HdcH1aBSU5r7Nn1Gdicrv+1AxVgDm61MHC/TK5Gd+kIlehnmRpYytTKAj0aYoUBL
	CAu0ZrXQ3he8Jz9MxPJRdd+y17mb8TabMurRKW8lij0Ypnz4B3V0ozPDl5DN5sXK
	wX67vqXSixWzvdSUZNzNSQRfF+aTyd1YAKzxFvAXTHN3PFXKhzZ4hMXQwwg1sepZ
	c+aT/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5u7s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 03 Sep 2026 06:38:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so58391485a.1
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417526; x=1789022326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=LdQ/riQT2eT9C0pMhHQmohtxPKaHmDhC2JVjUUvvo5O/RT++QsUKT4QzHuzcuETLQ5
         /JhK40Eip0ZkJQKtPpaVP4jNc92OAC8Fwy2P75ArZvCLuFJ3xg+5jK6UoC9n2S+3ESIX
         WV9OtSo31rziG6BwddMNIh97N7jQDryErNOMfWdUehzJGYHse6ljxjoJ1WHr2cbgMV3D
         Lerr+BGfHTH2vrxfG4ymd1+JaOlzF07JM2YMkfYySiYYcwTI7YIhdjYP7wNvWzqbA34S
         Uc8WwoURqa3JKvtdwU4JVpinccv/dwwsO/R6edUh5uwezNZLcBscx/BXWHGoNzURGvoc
         wlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417526; x=1789022326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=YeDhJNtWpCMGSAKl1nMhCS7vTWIqs9D12Lt+Nw5ZAWK8U8e2FnsY3wyivLAnh/8XaW
         HB6g90RRFmn6sj//+tAul+HkxGF1B3LxmRK1JlzrMZvK0nzQkhNcvgf6mbCBkb7180y7
         OkdeIn0mBkVG2PizqyDadQDEpJ9GHRKOJGINM6UOdIfuprlXOSGhXhtw3xs3v01iF7lt
         N9Aesdy2oaCRV6uib4JdePqJw+pfQCDilWaARrvPCz7wTUw9T9NLNR+27SKe3aYgamux
         gyukLS+Irv7ITw2ryBlsZzc5+BEvwWGhGb9i7QlOJsEmHKp6UPu3ZFt8N3piDpXGGZSG
         JXyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6wBtQmzPHzGhK5lOGPWHifPJMR6YaiNJ8vVJfP91w1Mabo+uhKaVrmqLE7xpdXjX6K6d99Q1vP5TAPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k/PxDb0SHzxU0EQbyfnas4h52+wS2ksfKjNSnwDnHOeryFZ2Be
	o/5XK5SGlde2/twhszTjUxgZuI6Yp9Vvzh3+WuItAHXSI5XUosEQwpHcC2S2+aICf4WaoHMm7+1
	5q6M9QVRJt04TiT9fu3ilD5WzmSfmgHdkkYBU5COprYbqKqHF6GrhwuDnvloY+tnXrg==
X-Gm-Gg: AYBFou0TtZpQsSkqs/Fhd2T8ZLH49twDUDTNYeTWANBowydbKfe1+xbdBs+dOnIWIj2
	iUyZ7fjwZIV9reH0JNd3GmkB+xZ65m0h7U6wjK7fc6Wf0oJ0CAAlMZ2KYD8PEYD9WmzZhRsi0rE
	tf+AIRdEzmdnuX56dzW03taF8Ghn6z6F0HU+uDdrP+8qFMdN/rj85m2ASeh4NzKD6FRgOvVJYNR
	bVPy8TQlwYYxKSCbl5RCgyk0z9yuPBParSqhPd5ofCEOVJV5Lcvk13EDdyZGbQIZnSWUjE+Dmem
	Zo+Eu4goce6VKTKDMKld+9N2fU/yMW9pO0103eABCSJc6xkcybohkMmVLhsYnr6aG6zd/cD8e9O
	fNCPAPF09BA+AnGC8lbCFfA==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362288385a.2.1788417526126;
        Wed, 02 Sep 2026 23:38:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362286285a.2.1788417525612;
        Wed, 02 Sep 2026 23:38:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm40501766b.35.2026.09.02.23.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:38:44 -0700 (PDT)
Message-ID: <ec4c4c56-f976-4e6e-9b62-127952e839ea@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:38:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670-google: Add NFC support
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9915f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ROI8ggJMWDmTJZJ5NsAA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nm4UITl0r2M3_FZcyJDC5KEZ8bUS0v_x
X-Proofpoint-ORIG-GUID: nm4UITl0r2M3_FZcyJDC5KEZ8bUS0v_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX8cSDn1UuOwSa
 iYutKAumHEEiYfquBBUvsCcCGHPu29JafAyL1tHMn8Klzd7+2Og0kwPkiCQeEj9fjHEh2C4hrIK
 Elno6wLdGacjbr+dTgCHLgli5PVGgElqrXBp7SMGTrq9w+DnP/3rocypW8x+OkU0A8M0Q5kWRuH
 T9G1yOSyd0j+vL2HOfJEVuQNnisEMhJa43XPhT1HWbIjJXjW8dCiZr1uE5uVgpds+CPk+9Zda3j
 Lkpvkk3rKvSM7Sdk7Zv/Hk9Wm1TBh9GrBzSpZNqSHnBDxxWs5BVPlK85SPheIYIh62BMZjYB0LK
 gaj+eKc8RdlosHln7ABcJBSGDfMArJVgqO/FFABJ24Zqpzz+ikxMczDFQHRHbcb+OGt/Rb3X0AW
 9phFZ2s5gJwnzf02Q2WZSYLQnOakMUywkEx4+HfOXafWuPZVvAGTcu07ihrxOxRxAKjWiCYNUkA
 479lNdbSjmVmBYIRcaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX/i0/XZ8YWJL3
 htVNusbk4/B4MyeeybGW/rlRjGhQ8cZkELAOyZYEusgA+7TtRai2P/L9uxGP5xdOB7G50B8i/d2
 9pv8so4XPXQ95+XJCXEbL6VP9TdhhHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The NFC driver can detect and read an NFC tag.

We would hope so..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

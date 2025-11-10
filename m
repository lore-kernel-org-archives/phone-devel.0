Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A772571DD
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790352; cv=none; b=sNSCQhfHV84vP9/S0sqopdfHGjba/M0LjiE+zMvtO5+zGzN7qA0mjGk5gWu3Gv7QE5ZoSJlrCWoiJoGCiCSA0ZtqwHnDci5TbwDWO0quLWx+KwV82XKwZO2dYlD48y+sFjVyiE4gr8LqM1qMB1FgxkYNPXm4O8EEpRU2lu5XINY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790352; c=relaxed/simple;
	bh=MRx0liLxwwjdaqyTRdesnQ7CY2LbmOfssXBSH9YMeyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWTNRgxsaOKHcga7NHX74M1PKeyiw7gYha6Ni6twv/J4gGMDhcDFUaBdN3NitY8XrIleR2KZJ6R1Q0VZ7Pbc6t/w9ZbBwPZlpLbcmKo0eak9Zgh0M3rjO/oT0oYP45UoC6KKzCKtgKAkPpIpg4HQs+mq64XxWQKsI7F18hVy+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIehK0CL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJiZejO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIehK0CL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJiZejO+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACMuH13306789
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t44ZoX+OCNSqApq3I3ABJHbi
	eiUu0iSqHG34zLANGOQ=; b=OIehK0CLRG0uaZdEa2h0EyqOKPKYYgur28MTqYFv
	DLIMJaq9w0RsEFJgw3qYbBWRdtkMfm6ta6+sd0KG1kSQnKdXe4iKatb8hz78uFbI
	kqgS7KiYf62njySyApWs1mJlFLI85dUXG7exAnUjkSBPfVcHVXdS4vhhz2fP1F2w
	A2yoGRR1HgX+5UJm6cH+Mw2ZkZI5YnpaFDmKJZFBqd0hFv9CjLIDTdjPwlSaCmQp
	l2hwzM3aFNhsutHpBM1HnBh/xpsIL2+YEH2XmodANjOuNQVqgeMsUB9/9ZdgxY78
	xz9ZOEkhn3H5V2XjmgEhse9LBo4EnixiNLQUY1gKaXVebA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8mav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:59:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb31eed49so36260261cf.2
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 07:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762790350; x=1763395150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t44ZoX+OCNSqApq3I3ABJHbieiUu0iSqHG34zLANGOQ=;
        b=QJiZejO+5B9kY/5X2RMI1fDhH14jalupka0PeayZAI6vO6WQWeSbhH53pfD36otqKk
         AW6eBc3hSxnrqqnVewVIKU5lVV7d7XR+43oIUiHo2H/U9pW9oU4t3JlSvG1bNdIc6UsF
         guLpEY872+42FhNu4lYBl4s8J8gRDySZDbv9OWfeLhRidqkNPoyECtYGk+6VLY0t8RCA
         u/IC+dCgsdI78jI45OkpsURugT6H/znmjBztrfGqBQF4k5jUcX8f+MNQlliI1MnJYKF+
         04FIH5wMsVwdxIyGm+WV2ETN4OQ81ORkqROobyQT5qYJlD7eTinD21EsEX6/QtxY8Wv+
         mcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790350; x=1763395150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t44ZoX+OCNSqApq3I3ABJHbieiUu0iSqHG34zLANGOQ=;
        b=ULwIK0vhpYHrWuln3yXc21bA+y8OQlTW8czIKsMmmJ19147tRUIctopL3NbtjZkwWY
         lNhipz/8YIpyMGMlUCu9b/IGlHGeykwXJBY2CGOqxoCPdDw4QRqDx2ul+/yiCC5VBL/9
         VyBCR4CMGpF3zceoONa6MPz1bjM5a+hufVVUfAZvqekIPSrkK0c58u9VscXts5GCQE97
         V3v5Ww30ctFB4PIC7CE/7wlMMMLX9iw3RIy4dca2BhN9YkzEU7FUMM1xvaq/mg+QpD5y
         BuMdCXtjY3dJyVnzYT3er56HJOr9aA5hVKN4nfg8RpHLmrOG/UaTG6Ilo4oYZK0VVEK7
         2jeA==
X-Forwarded-Encrypted: i=1; AJvYcCXV4NTfUgtlEadAvFov/jmWN71yhZwZLYBXQ/ZwGr2VV+mBnE5Fuhjl1eBZ46fwdk3/vq7uZ1beOcwK5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JbKMyT9VFfZcIA/dNs7I3r6URho6I7wKZXwjrv+dE7WN1iAF
	ikCtli6/xnCA4xTVjjvOCKC5xxgV2R8i3/63OE3aL3etuCM5X5WfyWvWeEcI4yb9Q96Zr34Dr1U
	9BZ+c4Cl1wFPOU593IuE03J6pI6A1XncvgZh1KcifdS2DdZX/3QLpQC5svuAmw2Rp/w==
X-Gm-Gg: ASbGncsToGc7WuR4eCAmGfpRcmQkd8e693oJx7X181+FOIz6riKnSqtVDYUKHK3jO/n
	/1uWSgc/17zK9RXMQqffmD5JKF7quigYzX3aAKNDeP75dzW+Hq+9y63THAOqsUDWZKTrWw0otHk
	zYh1EZqQPP7tzTAH/2F3qiWQN/aDjuWpCxpGaEsNH1HOM7R6YZYBp/LNjpHLjql0E31WZWgEAoi
	0EpUXthKgqJGV90MYWv5+ItOj7b6RVysxQCZYwsJ7DeBAMG8PWJTz4syJcxs/6bKktgDJHXsLGt
	8yV1XqpznsofXTSAprZnN06KqjMLuoWfLquUxGFlvxbqg0jnGoarQVPF1Wtb9B0uWfRT7VW55eF
	IDmY+K2/PUAoK5wE2tCZ14EOflfF/q4ZBSmRl88mNySPjp7w3JzuFmJVwOAMIuDZQV6P5Z6f/hQ
	0vcdPKWGruxI6F
X-Received: by 2002:ac8:7fd3:0:b0:4ed:635c:17dd with SMTP id d75a77b69052e-4eda4e9fae0mr109401531cf.21.1762790349675;
        Mon, 10 Nov 2025 07:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyG1JLLeUFIOUuxfZXg9+JKwbDXX/NfxH3k4+DgtgJPW110VLxhoWxeZqyBAiRTf2OAuPWlw==
X-Received: by 2002:ac8:7fd3:0:b0:4ed:635c:17dd with SMTP id d75a77b69052e-4eda4e9fae0mr109401161cf.21.1762790349240;
        Mon, 10 Nov 2025 07:59:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a5930edsm4080456e87.94.2025.11.10.07.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:59:07 -0800 (PST)
Date: Mon, 10 Nov 2025 17:59:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k
 calibration variant
Message-ID: <wbe6z6z4q6xnbw4otq3vy62iepgsb6rf42sldkrsap3n547abk@ako6cd4tzryu>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-3-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-sdm845-calibration-variants-v1-3-2c536ada77c2@ixit.cz>
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69120bce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VnAOb1fkWFh9DQKIKVgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNSBTYWx0ZWRfX3fMLg5xN0xnx
 iN0gU1aoWD7CRee3hv3l9tI5BQSMuBALyPmbDRN0RzY5PP5kFQsWe6h8CBeNxbg+hBdjD59njl3
 axeefRxaWqENOXO7Uj6W0l3aAZfMPg+KvEblhYxZq7lb70IgRjhOv66dpwVT1S2uRQMs6gFGxiz
 aeR2I0DAamx45Z1ce+kv09YNA00miqcsvSyIDCIsZCYw5GHtVvi4bb/saMh2RL1khk7JaU9zN+6
 KcSVe8dWG1yL5DSU+71+oaJOXZdsTPvYNf19Y/v37/HitoL/qmONhYfU394ou+lZJJuNXZJdAAY
 zIAVo/4+4sp4e5FktKskuHiAfjUkai5B+1GBl2PgsD5Y/CPP7+tnhaKTVfzwd1yYSqaZAZs46Vb
 84Suay+FJwCFMG7TWLqDUuBwwWANPQ==
X-Proofpoint-GUID: VE6mYfes6I0BvH0C4AAhPEtZj-ZFhMcg
X-Proofpoint-ORIG-GUID: VE6mYfes6I0BvH0C4AAhPEtZj-ZFhMcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100135

On Mon, Nov 10, 2025 at 04:37:48PM +0100, David Heidelberg via B4 Relay wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> SDM845-based SHIFTPHONES SHIFT6mq has its own calibration files
> for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> Add the calibration variant name to the DTS to reflect this to
> allow using the calibration files from linux-firmware.
> 
> [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

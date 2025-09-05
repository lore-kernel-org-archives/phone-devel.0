Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7A145329
	for <phone-devel@vger.kernel.org>; Fri,  5 Sep 2025 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080025; cv=none; b=BxNiDuhCgi1/X5Amd99x2PfVggV99ROokxitH9v6K5tx0yVrbCB66wSqhWmUmmD3muHW2dIreJn4FFmQOtTd3c5SZTWXBzG1Lz6M0ydNcx9U7aGTopZwaR5+uPJtMGKJ7gBjhJ8IcqilY2xy0aweKzfB6YCqDRS7BZLV3NDQgdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080025; c=relaxed/simple;
	bh=h0O09iRsf9dHfeMthnJk999pMS5aMUcInRudkzUILkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyqyIxKusYJV7XNed6PJG3XYnjMBPW7AJxfniSrFfYmna7yye3NDyI3LzKyFCn5kc3F/RdeONXxUjxOFggH79Y5lXTXJZuFUPnofUizNYLD065K4jbqQEPhz5g5855sz8rVg9/EUvNQZ/3/01dq/zs0a59q527Fex39gknKNk5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8bULyHx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8bULyHx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856wnqi023218
	for <phone-devel@vger.kernel.org>; Fri, 5 Sep 2025 13:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LEqUXc5cbwTjOkkBL1dldf4G
	sxuKtt2JT9JVdaymvUY=; b=d8bULyHxtMyy4qKNiXFY3gFBjl+3oJl1y6bSpPD/
	QcfaJvpSj4Fsoa2XWuNo3HoorvWL+qCd7f/DVfvWB6pE7hh7zQ8WEeCIfQ+wwT6S
	w5Al1qefwhoV0WxtQWY5pqjLdtiureWuFqmAKyXstBrp2dp1qDJYhvSyTuReedqR
	QPzK1VztV7pciEa4bzqorSv3m0fhDnmusvYtD39dgKuA9Eu0yslelaT9KamiRY2Y
	SIEvqfeULowexsIbINxuoiJzfvNrMaTGFAgaCPcsN3DI3U3+cMuWVOgZCZntgp34
	MUxKXsh8yERd3uqUR3OgyO4ifCxgEnyjP5MZ00gIhdlQfg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0euf4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Sep 2025 13:47:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7222232866aso43707866d6.0
        for <phone-devel@vger.kernel.org>; Fri, 05 Sep 2025 06:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080021; x=1757684821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEqUXc5cbwTjOkkBL1dldf4GsxuKtt2JT9JVdaymvUY=;
        b=fAUyf2p6ilQoXXL/89nyqKOr1sNCyhRDPMc8vMnAc7bkB1M9d4UB+zsW2yMV4M0TQo
         ORcUgwAjJUjYWTzPmIdf9nbydS5xEv41Bjd1BzDIkmMIONNKHMoEZxRDufQrGai1pLDi
         M0IeGDy/05SGD/F4UXeKImn+muMTkSUvBufoTZko1sgPfk19Co9QkexrCKHTt9X/QwIW
         EK9IwvlbRs7iITgptQRVPClUIwkcvtTWCyYYT3KbzghJae1EQmAStEGRI9k2x1ve5b3f
         1iDsyZQR97AqI0pjSyGDzhPyZ3ORaOtejMgxZPk3S0/sReOpDqYS3GbSCBXCsLmgPcIb
         6rFg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ13EBc10fupc8areVQHD9Tu6BoAJ1o1zqI6PQ0zHCckOrYzBCjZGb3EMigl327rVTChU3+arf82mD5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI+tedtg95nmACoSzyDzPQkM1Rs++zrLDCtpFR2cPu3YA9jl4S
	FvxKWlGhLxI4UFzUSRMRTWjEQmPAZy4oVZuNun53kHC7MFcU4xDqMx03kjaPjVsXQwyObdywkFd
	TWDC+YKy/h5DmcQ2UNFU/jQDwn4RhSDZDjlvALDFSjt18carZ2I1I1mCEFKf5XXSzgA==
X-Gm-Gg: ASbGncuuBdYNWYZNIdtV5eNw4Ej02we5lbHAOT5FF5GVVe9SgZQh64jongKGI9wT/sg
	wm1jLroJnpY9mY9d5e47Is2pkeHpMVhR7BucF0Jmns724OXLp0QLL+xRmQAKs2JS50F30WqNbYy
	sYUGZJGIJti7wo2tubpN+ioVhn5WMAb9m7nMpKsbhS6X6rDEBqwnVUD2+/iGlrA77QHCj0fZjq6
	Bg1ZT0byClK3uplYGAoax2uKGbx695BSgRvGb/sxJH1H7jAw8878kICvSkZe5CIjwfkJ9YXGijd
	paeeTNoZqXGxgxvlzw1+hGURANied6E6HpPr8A48XPAG/Jll1Ph1KaCpDKKZFZVslE732yPLhUR
	ZgfHwmA5TEriD+Xv0p8VqC8zgxHu2rvq8Qayeg4wJx9rpcrqtDKI+
X-Received: by 2002:a05:6214:1948:b0:716:fdea:db16 with SMTP id 6a1803df08f44-72bbf3fb1eamr41244646d6.12.1757080020541;
        Fri, 05 Sep 2025 06:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF99i4+ZgNHpEENrXMMJgwJoCqpA1mmRHdqXIu/OPhQnChIfbPSAVcT15ZOYrUVmX+skG5VYQ==
X-Received: by 2002:a05:6214:1948:b0:716:fdea:db16 with SMTP id 6a1803df08f44-72bbf3fb1eamr41244306d6.12.1757080019748;
        Fri, 05 Sep 2025 06:46:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc63c8sm1812504e87.61.2025.09.05.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:46:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: pas: Add Milos remoteproc
 support
Message-ID: <nxhx4ocjpeeyyttqqbzwfax2kf3qd27cbfurvggzgds5utplyr@zt3vk4zpmy6g>
References: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
 <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
X-Proofpoint-GUID: CMqE-B5DlK39Az8bS3pQM-hKhLup3FQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXwDSh6d7DzQjg
 NaFC6DoebmiKQPXndUJopFS/0jQK30mQfkiPuyTA2ta3Ub1fZ8B9ImnCjcK7cG+j0WF4I/aWfhB
 gpwiEX6XWsq0g19CyBPnurqwnRkkQfY1vFc1DmCZ07nPrbNTncnKijVeYLQp8vlwps4+8jky4ei
 LlZQQwrBXavlMQuw9HBs0xZAeDwgVN7J5UwCOuRLr6Ta4U+mExnqqWTLMFPEMX5bXLWsaT9dclr
 K7CykqvVO80TsAMxdjf+vtbkDW+ipuHwGX5uLqsrmS2lTLPOxIMDuasTHF8gwDaSwGgidavHD9B
 OZqjct1cMeha7fCe4+SXsCLg5fjmUk9g2v34r87gZecOpEt/P/qEy09RbflopI0g1hgCIXj2sW8
 hqAChVGM
X-Proofpoint-ORIG-GUID: CMqE-B5DlK39Az8bS3pQM-hKhLup3FQZ
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68bae9d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=ENn5GrddmNxYPxOGv5YA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Fri, Sep 05, 2025 at 11:37:05AM +0200, Luca Weiss wrote:
> Add the different remoteprocs found on the Milos SoC: ADSP, CDSP, MPSS
> and WPSS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

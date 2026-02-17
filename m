Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F68231A3B
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313826; cv=none; b=ebK9xxN6+5CJMgGHkOdKghktSfdehTSz92jzie6D29J74Pbz62RyKhj9wky4oPb63JNqxjOvUZJ1/NUvtAQY8nb/XoeOca7mHqCrMWT0YR08bsCG5U/+ByGv04fxSC20HY8OHZhKuTHhu7wi1KUtyJ3CDssjwrUVNEyniI0yAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313826; c=relaxed/simple;
	bh=bm649JNZeV26nodFWhz70BQBjB2uTADIjYJ92op2J8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpNoIfxne/3gU8vBxDp1vcxxs3pLqww8nW9k7A/VGjKFRB9oF1iRO7tYCL679xZC7zxA1q0s5wiUdObCuSNDBLSmJRWApV9jdtTMDCEdskEzJkmFdTqw2I9G3kVRT3O6HBKwPZjqi/eDqr90XLX1yTnUZeEJ2OvYXcMJNAi1Mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1ejZRZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWOvpaX+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1ejZRZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWOvpaX+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GGUIms1601378
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7t4M9jcxIIwiP2uTSN2cmr8C
	9cmLt1ut6OeHScfvuJk=; b=D1ejZRZfgLCZ1eIlaKbUOazfYcpgzo6MWTMxKVLe
	nrJX4PeW9QP8cYpxBvJZiV5Tn9tmSwkEUO252YkBbEx7qcnKNNp2TJkJgd+f95Vs
	aiU0tKtGvPYt5N8d463EahfRFrQYe6ewVnbchLKbl3odiT+QkMEmEKx3qj20Nth5
	FXpQm1g0++i3uWno69Q7zx88rJkDnGZ/g6Bf6vADA9FGIkf3zaA9Fax8s0L38vbR
	/LRTYLCdrG0ffhKdAfLStgT7x8BukrwrLD8e4ENB4GSacuAm07yCQQEFYH5HlkZm
	tXARp29wa39Ai8V77l90o5HrjhyQ8b4NAsg4Mn6jxWLrQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9eej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so2575497585a.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313823; x=1771918623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7t4M9jcxIIwiP2uTSN2cmr8C9cmLt1ut6OeHScfvuJk=;
        b=EWOvpaX+MBUOeyWsWb70Pz/5pJqOGvUyOqI9PSdKeciHC36Qo86WlpZV9yO1bf28fP
         NdO2oFJuMsnlxB5w6JdEX13cAPY0P7Vr41ZGAhytrYQeUbk2YAQniQ5cBnEgrKu/dJNu
         uzXfFKShwubA8diivAc0Wrgxn3p+2A2YgbYjrSWjEKrFOE4/dG1vsiEO45eMRmnFyn/g
         o1M6OI2Qq1tgbxdpVDAiEOwtZnxSPyd3IPLPDfs7rTu0jPw1v998khSnhjTSfiAxj1ZH
         brvb2rMEf0fGVmaiuRep3KMNfRH80hNGnaRXls40TjCCW5/UAfmoVVHmAGgGJW1CioZ4
         OpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313823; x=1771918623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t4M9jcxIIwiP2uTSN2cmr8C9cmLt1ut6OeHScfvuJk=;
        b=FU7bslNcM4FMwJ7CeKozf3bFd8xpS0y9VA3iHWj+OHTIAACWkoxmoo7Z5QPK695ZqN
         gZ2FQwyEGM/jsbU1ZcvFGa2JevZ1ImgyZpb2v6vT5nFqextgWDI/LB3+h7u/38E1x4Xl
         Q+Cr7bzQ++LkoV9jnsYuCYryUyu8jX2QAHHZx2sZisAwPxfNU3bLTv8rqdFzMU5Mabih
         fraCXzjhjoF7hXqvPxgmWVTIouQOhJVaphiRZerbEtLjT01kpf1q4R+Dt2BWuYKLppQo
         Bq6sqLEbVvvr4WvOXixVwSI6wQm5gdQ2QobHdV4xEAtNCqfCRLHbrXFICoSX4NtowS6s
         RBHg==
X-Forwarded-Encrypted: i=1; AJvYcCUMWlwEMlptIHPtHGbQBOhkChr/ZbFiL0zb5IGNqNhLyKMWmVxtCb899Wylmnxu60hg4LWthj2xvdEugw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxufjoaJJn4JkiYJ54td6VW7iDnSNMCwIAXstxbEtp7HiUmicQt
	He6Lr2jO8b0kqM5OxU+Ma1PtAjD2G6+jRamU7AB6xeRkezJLYGWdaFvOulbnL1JX8SjNTLxDHh/
	3EY+Jr43ZkXBn2J8BOBj7mbXUUFlUy7SjLi0BAYJKD3OpBgyF9BTQzsd4uWqsbSE1Og==
X-Gm-Gg: AZuq6aJW5ZmvUQy4GKemIduEVE7v6+vRzuvqm56WhoQzncel15P9QRdHYIwmOYjBLWZ
	dL9vLq0DDFVGtcZ4+fVwoyOafdjClNeLTiChK0H41nYZ12hoNy+YsH4jfqbig2zf3/2DFEvo2Dx
	6LJG31zHVNqEb/ddGI9Ao26wjAlRo+Ew8IXDbb7nLpwRiBf/V3orpd9k9jFMYSHDbvSWf/iFfVA
	zp6wVITq8Hm2OsBqClRJ0NS8VGO1K4gAXcqKTbvLdVIbrlJ1dr01DtsgUe8is1CcRIkLnKL/aBz
	tRvSmBdp/QacNgAvjcyN92LQY4nAoppOq5qLUq0yT5YINCmLQYFeDyRZ72ZmxBWToychTP+u9T4
	hjPducmRFhkYT9LotxXm7uOvOr+7KE+GZD1vjFzgKSEISKOlPkZtkReic01+KiLceOnrjBnlClp
	dRvXAxQP8ZODD09iVzNOi+AJ28enr2f0OYSrI=
X-Received: by 2002:a05:620a:408c:b0:8c7:14be:ea58 with SMTP id af79cd13be357-8cb4ac0a7fdmr1197236985a.19.1771313823069;
        Mon, 16 Feb 2026 23:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:408c:b0:8c7:14be:ea58 with SMTP id af79cd13be357-8cb4ac0a7fdmr1197235885a.19.1771313822635;
        Mon, 16 Feb 2026 23:37:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5e11sm31662061fa.21.2026.02.16.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:01 -0800 (PST)
Date: Tue, 17 Feb 2026 09:36:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Message-ID: <r733gmfae4jae3zkjougpagyr2llx6v7ry3lm6rldvmpma6rcn@ebmd3dgvd7ta>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-5-val@packett.cool>
X-Proofpoint-GUID: NvftiZXbzypVS9yZDguJS7oY7aAr_n5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX7VX8VA2pOiUp
 oHUHs9huwpsW6z31C4parBcWlU+DbCDFizHQfVZND2F0DveH9hyKo4QAVXIztai5boXdLaCN5OW
 FNPFQYgZuJY2PcD/aeMfl+jypdGUOTTXFLoR0V6SxebCH2Li513NhL8+HUUr3VHnYi/5MM6M/Z3
 +rShGkVnRWf6gGl+qbNDk+Yr2tAS/joLKPeSAhZiWYI+Vh7nx7VwmtWpHCWs/acXVuy18VTVCXy
 AyofFs1cVnOyDB88FDc37hzfgWff/ghRvMeQi3UoZkBs1e5D36NDLY0mrsOZ2LKKdSkwzh56aad
 5shhpj8rgL7UDCiBhMBt+5VovGR4IN1cic/WFtgrLusBl8PEcsmzKbE6ftfvOlcNA2BpV5/kxb3
 ncoQCz+2Lx+aD/RvQvoslnlgfurrvvR0E/AztqFGBtWOK3RXXnGXcHcf7qAmEtefXTu0Icb9dDV
 DTsyGMMK3mTjqS2Wukg==
X-Proofpoint-ORIG-GUID: NvftiZXbzypVS9yZDguJS7oY7aAr_n5h
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69941a9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=GY9tGbHfO7DmpnXFqVcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062

On Mon, Feb 16, 2026 at 08:25:21PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6115.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

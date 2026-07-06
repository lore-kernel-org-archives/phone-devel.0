Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4768637B40A
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348418; cv=none; b=s3VM8flUplUh2wEvYS4NTDVxtpQeVv9VNKb7Xd4GLt7pbX+bQWw5QO7a0p7HX4JhwDWHO9gxV64W0WY+mvOOlI+1O/IFmNG8lVVLU9nX6wFHtVgKbPpnHm+MCBHLEhtNvNYg8pDZRl5paqyvjSu6tbzJCRKyIPGdwANJaeXlEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348418; c=relaxed/simple;
	bh=Zv19/+GZ6cOuxDrtBFdPj15RwKwBFX9aaiyloecDSXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Wlt0LNQ4SJf0vbFRm2i2hzOmCOzwI0Iw3obP5LO966vOPmP5wTxLQS5ruvsarXEuH82+62YqsABXdv8agFTOk+UCTadfDkq7JaTznpnMlMe87OQMzyAkDRTH51Cpp6CedrxZ2SLntMpw1mo4PT5x0im7NI/WJCImA1rRpmPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtyUQ98j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGleBee4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtyUQ98j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGleBee4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDrbt810627
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 14:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zyQtYGJ8z5oEr6iVTxJjS8i
	/YH8lsktPhQpqrHWPME=; b=RtyUQ98j9IpUKUc602VLeGGpME6N8e++WX5Sk30Y
	TEjQqCaSAMJefSnvSzoIgbtSqPFcVBD8CPO2aaqBCh5gjeAd4V4hmMZyvlAw6YAy
	NF7vEMfySEWcf1+B6IX/+6lOBT+MqtHH58xIs/dsFYewozMsWij+409wKyDB1lVg
	jIOYhsJVETDIFq9CGTmaS1cgQADykmrRGeWe+fddvQXA9rT4KH3q5FEN3JDjiCvm
	uiAqjPs09RaSesvrjq0frXKlm+xfXLhwDRKOW+h6BxrWUngCVK0mhHTWRg3d0xyg
	ivJF4be0WwZ9Bkor0Fvh3BbKNlxobGsu1zFOgOKfRg9ImA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usfrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 14:33:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so321972885a.2
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348416; x=1783953216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zyQtYGJ8z5oEr6iVTxJjS8i/YH8lsktPhQpqrHWPME=;
        b=FGleBee4OKoIQDzoTachOzZoRMe5z01/t210IPX4ULc+hs9gMSl1N/5JnfoMZPo2nx
         y2lRtHVpiVsmAlkWm+uAJww4mgypwhQyAPANmT1T2eRD12beCgasEi+8EuJkPgFuZQrE
         XB+Q8sUp51YboD74T+0oBTw9KbBorooL0pM6IMjo88sMyZNam2Ye0al0voef3I/5p0wL
         hR2YdkzbnAqtZbs4ttzTwZLcgL8Rj4O5zYv7m2Jw+MTFP9DRSzOEkIDMDdsw2U7Vu8Kc
         00nTtRVcg+s9XhuEK+rv7xIxs5QtHwES+41EgXn/amKcauFz065U0mSCEIE1AoXLIzgF
         qvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348416; x=1783953216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zyQtYGJ8z5oEr6iVTxJjS8i/YH8lsktPhQpqrHWPME=;
        b=hBlOCTl3wqxaGYT5dLhwrQ0ymjjAiQIq+WBlQ5oxYz/PZTcqxpynCeFqFgyMILZzu8
         X1bA6IDYO/N/9S7xLFAwevnk8QTFRZPDBEl/pZlmzlO07IPVkdx5zMmPMjBQC6xvvNwa
         8gYRtDOwIZvmbb1hMFILcmNTLe6J8IFscLSuXfbHDXRwCjyZ6WuAKmzEtEksMvV5jZ5G
         KQ7QEXbN4YlDYdT39avze+OI/F4aVJ45EDRtzYy9Xay+D7hDP+sBadAlXjg3hqJBSpUG
         lljHhokTRB9HYZvSjOnXQMetxPCz34EXDWPTBSMziEQ93EulN2HTh8XaRD9G/tF8G3gd
         zh1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCGxSq6SgewWh30HtEsXCNubyCcl2ETaW8Wl5yo/Jx8S8ud93KWJeSCYXeDKnmdl2WNLbD5Jf9MCuyaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVEIS1fqVK9rN/+IjuHJH08FfYbS503+vD8AxNVHmMe/rBhxv
	m/sdf1SJpsjSDskdgvNqenyIPsckqOxkBY1ndrgXoSgQ40dyLw8gbbUDuiatN2IFhgASKhkE8F0
	Np8oo3R0l7mR2EcfMWPQfXf7dM6fVwP+IzOCwGfAIECMI1QsATgw0QbwtqM221GltEA==
X-Gm-Gg: AfdE7ckpiYPcibPm+rBBEXYYJTlBtp/jGVZSL4esPT1QDds0T+tDYx4rMohHFUaqcHX
	qqMxPgtfihb/Zk7zp+RNKhrcIEpZpdDtAdN3WAx4GYDx2vofPNSEL0R7ydEmEMqvldETw3EW3G8
	sdzf16VwvdCSwu2tkYYUWMrgQbP5UZhwMCecEuWaw3SanmMX9D8cs2DooqhsbQg13lvPEZD/ZnN
	mTXq3+7VnwUo+Rgjs1pHdnfKcXHvgIxJFhEtS4xpYc/e/HCNiAhazRF6JyMWpI4nIbGwD5U143r
	Sdww8Z655mC8JUomia1j6RJpRjaZ4/no0SwhzHma92hEZ01AZ/kVe3Ka5brY8HIk8ZG+tol6DkM
	gQ5r3yUIklKHRa1McWQiIYXE59nCM1YNCLT6ZN16gg65Tpjv3EcN/i3cBkB1bNoZhsew44rlbHG
	m3Sk2qIU/qNUNBKzrdA/bJCG9B
X-Received: by 2002:a05:620a:1728:b0:92b:6805:91aa with SMTP id af79cd13be357-92ebb5c875bmr113683185a.66.1783348415400;
        Mon, 06 Jul 2026 07:33:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:92b:6805:91aa with SMTP id af79cd13be357-92ebb5c875bmr113676785a.66.1783348414849;
        Mon, 06 Jul 2026 07:33:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8d0esm2964202e87.84.2026.07.06.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:33:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:33:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
Message-ID: <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
 <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
X-Proofpoint-GUID: ZzToud-QZm1YLOQ4Tf7FG929gSbwt6G3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX7fPhUSdgn4W5
 KwQQXOgXAFtTNCMwXR3AkgKN2afab8MqCPDTm+7ueZ0PJzKPXMGRR5wO+5PHa/qZ0WqrVOCw6Ij
 7Ef5IvW8iIuk13WbhALHX/U8Bfzv4yM=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bbcc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=30hatntaN9mTsT5xc2EA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfXx6eteob0SDMD
 davL6TTWZCy6a0JYtyikDyqNgXUy9VmjARlnFGMF3KgA7ThewUG2R01RuVQkOm3J3clB/W0tqBw
 YzUEWvrV8fpbw0WSk+lfI4wHkcygA71DY6C75vfxhfg6TfkfkxS3yZVevIWagQz24DZMN8Vfv09
 y6ePGoziypKMLKLGpTbbdZLw9QwrY1GzrCiN0GU7jGw+aGtyqInbJsx5H0qUBUvsLRMiEdmuUO0
 KIdj16VVhdBke15bTD2SJ1MrPPdZiocOHfdNm7vpl14U3QXZR67FB+DuPePX+gPQYO1zWcbwghP
 JODXzJkMj8MzdxH27UZMoEZrACrGtgLOr0fYy24YlESzH5lxgzWnG6Lb7hKMCF9Iqy/UgSjKJ0Z
 9Q5JE0gOLMk+nDRExi6FEFqGV+VZTDztOWAvkdk0KQxK+Y91vtkWmCLR1QHxw7PDvOQsRa1Ec6U
 Q8aemB7u1iocdYy0a5w==
X-Proofpoint-ORIG-GUID: ZzToud-QZm1YLOQ4Tf7FG929gSbwt6G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060147

On Mon, Jul 06, 2026 at 03:38:42PM +0200, Konrad Dybcio wrote:
> On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
> >>> +&usb_1_dwc3 {
> >>> +	dr_mode = "peripheral";
> >>> +	maximum-speed = "high-speed";
> >>
> >> Does super-speed not work (if you also remove the qcom,select... above)?
> >>
> >> Konrad
> > 
> > I can make a file transfer over scp, but the speed is inconsistent and
> > slower than with high-speed. Must be because this device does not
> > support USB 3.0 (super-speed).
> 
> I'm asking whether it enumerates as super-speed if you make the changes
> I referred to and use a super-speed cable.
> 
> Some devices wouldn't, because not all manufacturers connect the
> necessary TX/RX lines on the Type-C port.

the GSM arena lists those phones as having USB 2.0 only.

-- 
With best wishes
Dmitry
